# Dromotherm

site for dromotherm.fr

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
date: AAAA-MM-DD
categories: [project management, other category]
---
```
Date and categories are optional

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


## Generate pdf

To generate pdf from the blog is possible, using wkhtmltopdf.

Just install a binary from https://wkhtmltopdf.org/downloads.html

On windows, do not forget to include in your path something like `C:\Program Files\wkhtmltopdf\bin`

Then use the following commands to produce pdf docs, with dedicated banner and footer included on the blog main page :

```
wkhtmltopdf -L 15 -R 15 --header-html https://dromotherm.github.io/blog/banner/ --margin-top "25mm" --no-header-line --footer-html https://dromotherm.github.io/blog/footer/ --margin-bottom "25mm" https://dromotherm.github.io/blog/homePrintEn/ dromothermEn.pdf
```

```
wkhtmltopdf -L 15 -R 15 --header-html https://dromotherm.github.io/blog/banner/ --margin-top "25mm" --no-header-line --footer-html https://dromotherm.github.io/blog/footer/ --margin-bottom "25mm" https://dromotherm.github.io/blog/homePrint/ dromotherm.pdf
```

for more information on wkhtmltopdf :

https://wkhtmltopdf.org/usage/wkhtmltopdf.txt

https://github.com/wkhtmltopdf/wkhtmltopdf/issues/2940

for other tools, investigate https://weasyprint.org/

cf https://blog.rebased.pl/2018/07/12/wkhtmltopdf-considered-harmful.html

