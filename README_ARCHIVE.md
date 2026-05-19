deprecated in 2026 - using chromium pdf

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