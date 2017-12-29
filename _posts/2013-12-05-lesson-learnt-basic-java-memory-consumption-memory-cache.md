---
title: 'Lesson learnt : Basic Java memory consumption for in-memory cache.'
comments: true
author: Noppanit Charassinvichai
dsq_thread_id:
  - 2028298889
categories:
  - Java
  - Knowledges
tags:
  - Java
  - memory
  - performance
---
I know that these days we&#8217;re in the era of cheap memory. You can pretty much get 8GB of memory on a Notebook off the shelf. I can still remember in the past when I was playing with my 486DX with 64Mb or memory and it was too fast! yeah. People might question what am I doing using a lot of memory and why would you care. In my case, I&#8217;m building a cache which I have to pretty much hold every single object inside the memory. I have over 1 million objects. Well it&#8217;s just 1 million objects which it&#8217;s not a big deal but I have to index and make it searchable which I was told to use hibernate search. Hiberate search is pretty much a wrapper on top of Lucene. That&#8217;s why my my cache it&#8217;s very memory consuming. So, I have to be very careful what I put in my domain object. The example I&#8217;m using it&#8217;s just a basic example which in the real project there will be much more than just this. 

For example, I have one **Store** object which it has a method to return jsonified string. So, what I did I just passed **ObjectMapper** to transform my object to be json. However, what I didn&#8217;t realise was that if I passed that from the constructor my object has to store **ObjectMapper** inside the object as well and **ObjectMapper** is a really beefy object. So, If I created a million objects I have to hold another million objects of ObjectMapper as well. So, I just had to pass **ObjectMapper** just when I want to use it. And that save me a lot of memory.

``` java
package com.noppanit;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Test;

import java.io.Serializable;
import java.util.HashMap;

import static com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility.ANY;
import static com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility.NONE;

public class TestMemoryConsumption {
    private static final long MEGABYTE = 1024L * 1024L;
    public static final int LOOP = 1000000;

    public static long bytesToMegabytes(long bytes) {
        return bytes / MEGABYTE;
    }

    @Test
    public void testMemoryConsumption() throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        HashMap<String, Object> map = new HashMap<String, Object>();
        for (int i = 0; i < LOOP; i++) {
            StoreWithToJson storeWithToJson = new StoreWithToJson("name", "description", objectMapper);
            map.put(String.valueOf(i), storeWithToJson);
        }

        printMemoryConsumption();

    }

    @Test
    public void testMemoryConsumptionWithoutObjectMapper() throws Exception {
        HashMap<String, Object> map = new HashMap<String, Object>();
        for (int i = 0; i < LOOP; i++) {
            Store store = new Store("name", "description");
            map.put(String.valueOf(i), store);
        }

        printMemoryConsumption();

    }

    private void printMemoryConsumption() {
        Runtime runtime = Runtime.getRuntime();
        runtime.gc();
        System.runFinalization();
        long memory = runtime.totalMemory() - runtime.freeMemory();
        System.out.println("Used memory is bytes: " + memory);
        System.out.println("Used memory is megabytes: "
                + bytesToMegabytes(memory));
    }
}

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE, getterVisibility = ANY, setterVisibility = NONE)
class StoreWithToJson implements Serializable {
    private String name;
    private String description;
    private ObjectMapper mapper;

    public StoreWithToJson(String name, String description, ObjectMapper mapper) {
        this.name = name;
        this.description = description;
        this.mapper = mapper;
    }

    public String toJson() throws JsonProcessingException {
        return mapper.writeValueAsString(this);
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }
}


class Store implements Serializable {
    private String name;
    private String description;

    public Store(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }
}
```


Result from passing **ObjectMapper** from the constructor.

```
Used memory is bytes: 3723968
Used memory is megabytes: 3
```

Result from passing **ObjectMapper** just when I want to use it.

```
Used memory is bytes: 1928536
Used memory is megabytes: 1
```

I know this might be obvious for some people but if you have the same problems as myself this might help shed some lights to something else.
