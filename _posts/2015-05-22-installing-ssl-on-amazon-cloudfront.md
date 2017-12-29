---
title: Installing SSL on Amazon CloudFront
comments: true
author: Noppanit Charassinvichai
dsq_thread_id:
  - 3785564516
categories:
  - Security
  - Techniques
tags:
  - amazon
  - aws
  - cloudfront
  - openssl
  - security
  - ssl
---
We have just installed SSL on our Amazon CloudFront. We followed this [blog post][1] from Bryce which I think it&#8217;s really good already. However, I was stuck on the last part where you have to upload the certificate to IAM. The difference is that I had to concatenate the crt files myself and I didn&#8217;t know how to do it. So I spent quite a long time to figure it out. I thought I would write this so it might help save sometime for anybody. 

If your SSL providers gave you the chained certificate already, then you don&#8217;t have to do anything else. However, when I downloaded my crt files I found this

```
my_domain.crt
AddTrustExternalCARoot.crt
TrustedSecureCertificateAuthority5.crt
USERTrustRSAAddTrustCA.rt
```

And I&#8217;m shocked. So, I thought I would need to upload all of them three times which I did but only one got through and I thought the others must have been backup or some kind (I know I&#8217;m pretty stupid). So, I used [SSL Checker][2] to check and the site said my trust is broken. I thought how could it be I did everything right. 

It turned out that I didn&#8217;t upload all of the chained certificate. So, I went again and I tried to upload the second file which I got a nice error from Amazon that my certificate is malformed. I&#8217;m stumped again. 

After a lot of digging and reading. I have to figured out the order of certificates and concatenate all the certificates in the right order until the root. You can ask your SSL provider if you want a quicker answer but I went the hard way. 

You can run this command

``` bash
openssl x509 -text -noout -in your_domain.crt
```

You should start with your **domain.crt** file which will be something like this

```
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            xxxxxx
        Signature Algorithm: xxxxx
        Issuer: C=US, ST=DE, L=Wilmington, O=Corporation Service Company, CN=Trusted Secure Certificate Authority 5
        Validity
            Not Before: 
            Not After : 
        Subject: C=US/postalCode=x, ST=xx, L=xxx, O=xxx, LLC, OU=xxx, OU=xxx, CN=xxx
```
You just need to look for Issuer which will tell you what is your next immediate certificate. In this case Trusted Secure Certificate Authority 5 is my first certificate and then you go on and do the next one.

``` bash
openssl x509 -text -noout -in TrustedSecureCertificateAuthority5.crt
```

You will get something like this

```
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            xxxxx
        Signature Algorithm: xxxx
        Issuer: C=US, ST=New Jersey, L=Jersey City, O=The USERTRUST Network, CN=USERTrust RSA Certification Authority
        Validity
            Not Before: Sep 10 00:00:00 2014 GMT
            Not After : Sep  9 23:59:59 2024 GMT
        Subject: C=US, ST=DE, L=Wilmington, O=Corporation Service Company, CN=Trusted Secure Certificate Authority 5
```

It means **USERTrust** is the next certificate then repeat the process again until you see this.

```
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number: xxxx
        Signature Algorithm: xxxxx
        Issuer: C=SE, O=AddTrust AB, OU=AddTrust External TTP Network, CN=AddTrust External CA Root
        Validity
            Not Before: May 30 10:48:38 2000 GMT
            Not After : May 30 10:48:38 2020 GMT
        Subject: C=SE, O=AddTrust AB, OU=AddTrust External TTP Network, CN=AddTrust External CA Root

```

If **Issuer** is the same as **Subject** that means this certificate is the root which is going to be the last. Now, what you can do is to concatenate in the correct order of all the certificates. 

You can use this command or you can use your favourite editor to do as well.

``` bash
cat first_crt second_crt third_crt > your_pem_file
```

Then when you&#8217;re ready to upload the certificate to Amazon you can just do this.

``` bash
aws iam upload-server-certificate --server-certificate-name your_domain \
--certificate-body file://your_domain.crt \
--private-key file://your_domain.private \
--certificate-chain file://your_pem_file \
--path /cloudfront/
```

The **&#8211;certificate-chain** should be your concatenated certificates.

The format of the **pem** should be something like this.
```
-----BEGIN CERTIFICATE-----
Intermediate certificate 2
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
Intermediate certificate 1
-----END CERTIFICATE-----
```

 [1]: https://bryce.fisher-fleig.org/blog/setting-up-ssl-on-aws-cloudfront-and-s3/
 [2]: https://www.digicert.com/help/
