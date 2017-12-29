---
title: JavaScript TDD on on file upload.
comments: true
author: Noppanit Charassinvichai
dsq_thread_id:
  - 1127763222
categories:
  - Javascript
tags:
  - html5
  - javascript
  - tdd
---
Right now, I&#8217;m trying to do HTML5 file upload but I also want to write some test as well. So, I just want to post it here. <http://postposttechnical.com/2011/03/spying-with-jasmine/> This blog post really inspires me on how to use Jasmine to drive JavaScript test. Maybe my code is wrong, but any feedback is welcome. 

So, I have this code

``` javascript
function Uploader(file) {
  this.file = file;
}

Uploader.prototype =  (function() {

  function upload_file(file, file_content, options) {
    
    var file_data = new FormData();
    file_data.append('filename', file.name);
    file_data.append('mimetype', file.type);
    file_data.append('data', file_content);
    file_data.append('size', file.size);

    $.ajax({
          url: "/upload/file",
          type: "POST",
          data: file_content,         
          contentType: file.type,
          success: function(){
              
          },
          error: function(){

          },
          xhr: function() {
              myXhr = $.ajaxSettings.xhr();
              if(myXhr.upload){
                  myXhr.upload.addEventListener('progress', options.progressbar, false);
              } else {
                  console.log("Upload progress is not supported.");
              }
              return myXhr;
          }
      });
  }

  function showPreview(file_content, thumbnailDiv) {
    var image = document.createElement("img");
    image.src =  file_content;

    thumbnailDiv.append(image);
  }

  return {
    upload : function(options) {
      var self = this,
        file_content = {},
        reader = new FileReader();
      
      reader.addEventListener("load", function(e) {
        file_content = e.target.result.split(',')[1];

        showPreview(e.target.result, options.thumbnailDiv);
        upload_file(self.file, file_content, options);
      }, false);
      

      reader.readAsDataURL(self.file);
    }
  };
})();
```


And this is my test

``` javascript
describe("Uploader", function() {
  var eventListener,
    fakeFile = {};

  beforeEach(function(){
    spyOn($, "ajax");
    eventListener = jasmine.createSpy();
    spyOn(window, "FileReader").andReturn({
      addEventListener: eventListener,
      readAsDataURL : function(file) {
        // do nothing.
      }
    });

    uploader = new Uploader(fakeFile);

  });

  it("should upload a file successfully", function() {
    thumbnailElement = $("<div></div>");
    uploader.upload({
      progressbar : function() {

      },
      thumbnailDiv : thumbnailElement
    });

    expect(eventListener.mostRecentCall.args[0]).toEqual('load');
    
    eventListener.mostRecentCall.args[1]({
      target : {
        result : 'file content'
      }
    });

    expect($.ajax.mostRecentCall.args[0]["url"]).toEqual("/upload/file");
    expect($.ajax.mostRecentCall.args[0]["type"]).toEqual("POST");
  });

  it("should show a preview image", function() {
    var thumbnailElement = {};

    thumbnailElement.append = jasmine.createSpy("fake thumbnail div");

    uploader.upload({
      progressbar : function() {

      },
      thumbnailDiv : thumbnailElement
    });

    eventListener.mostRecentCall.args[1]({
      target : {
        result : 'file_content'
      }
    });

    expect(thumbnailElement.append).toHaveBeenCalled();
    hasFileSrc = thumbnailElement.append.mostRecentCall.args[0].src.indexOf("file_content");
    expect(hasFileSrc).toNotEqual(-1);
  });
});
```

I had to spy on FileReader in order to test it. But it really help me improve my code.
