# Dromotherm

site for dromotherm.com
[![Build Status](https://travis-ci.org/dromotherm/blog.svg?branch=master)](https://travis-ci.org/dromotherm/blog)

http://dromotherm.github.io/blog

## Reminder - how to write posts

### deposit place
Posts are stored in the [_posts directory](/_posts)

### name and metadatas
A new post must be named :	AAAA-MM-DD-name_bla_bla.markdown

The file must start with a metadatas header
```
---
layout: post
title:  "Welcome !"
author: surname
draft: false
lang: "en"
ref: something
date: AAAA-MM-DD
categories: [project management, other category]
---
```
The author field is used to make the link with staff-members, as defined in the [_staff-members](/_staff-members) directory. In pratice, the software scans the _staff-members directory to find files whose metadatas header includes a ref field equal to the value that the post writer has given to the author field. 
If the surname given in the post as no corresponding file in the _staff-members directory, the post will nevertheless be available for reading

The lang field can be "fr", "en" or even something else. Make sure that the whole text of the post is in a single language.

If you don't want your post to be available in another language, just write a single file.

If you want a specific post to be available in french and english, you will have to create two files : 
- AAAA-MM-DD-name.markdown
- AAAA-MM-DD-nameEn.markdown
 
It is essential that both files have the same ref in the metadatas section 

date, draft and categories fields are optional

if draft is set to true, the post will be considered as a work in progress and will not be published online. Once you remove the draft field or set it to false, the post is pushed to the site by the jekyll engine

### structure

The post has to be written in the markdown syntax

```
# title
## subtitle
```

### Insert a link :
```
[text - description of the link](http://www.cerema.fr)
```

### Manage and insert images

Images are to be stored in the [assets directory](/assets)

To upload a new image with the github web UI
![upload new image via UI 1](/assets/doc/upload_illustration_1.png)
![upload new image via UI 2](/assets/doc/upload_illustration_2.png)

To insert a new image in a post, in a responsive manner (ie for mobile and desktop client)
```
![image description]({{ site.baseurl }}/path/to/image){:class="img-responsive"} 
```
For example /path/to/image can be `/assets/smartgrid.png`


## Pdf generation

To generate pdf from the blog is possible, using wkhtmltopdf.

Just install a binary from https://wkhtmltopdf.org/downloads.html

On windows, do not forget to include in your path something like `C:\Program Files\wkhtmltopdf\bin`

Use the following commands to produce pdf docs, with dedicated banner and footer included on the blog main page :

```
wkhtmltopdf -L 15 -R 15 --header-html https://dromotherm.github.io/blog/banner/ --margin-top "25mm" --no-header-line --footer-html https://dromotherm.github.io/blog/footer/ --margin-bottom "25mm" https://dromotherm.github.io/blog/homePrintEn/ dromothermEn.pdf
```

```
wkhtmltopdf -L 15 -R 15 --header-html https://dromotherm.github.io/blog/banner/ --margin-top "25mm" --no-header-line --footer-html https://dromotherm.github.io/blog/footer/ --margin-bottom "25mm" https://dromotherm.github.io/blog/homePrint/ dromotherm.pdf
```

When producing pdf on posts, do not use banner and footer :
```
wkhtmltopdf -L 15 -R 15 https://dromotherm.github.io/blog/project%20management/2019/09/29/project_kickoff.html post.pdf
```

for more information on wkhtmltopdf :

https://wkhtmltopdf.org/usage/wkhtmltopdf.txt (not very uptodate)

https://github.com/wkhtmltopdf/wkhtmltopdf/issues/2940

for other tools, investigate https://weasyprint.org/

cf https://blog.rebased.pl/2018/07/12/wkhtmltopdf-considered-harmful.html

https://github.com/Kozea/WeasyPrint

## Multilingual adaptation

Multilingual adaptation was realized with the help of the following article which describes a simple an elegant solution :

https://www.sylvaindurand.org/making-jekyll-multilingual/

the models have been adapted to be language sensitive

## Downloadable content

downloadable files are dynamically managed

Just drop them in :

[/assets/downloads/en](/assets/downloads/en) for documents written in english

[/assets/downloads/fr](/assets/downloads/fr) for documents written in french
