# encoding: utf-8
#
# Jekyll category page generator.
# http://recursive-design.com/projects/jekyll-plugins/
#
# Version: 0.1.4 (201101061053)
#
# Copyright (c) 2010 Dave Perrett, http://recursive-design.com/
# Licensed under the MIT license (http://www.opensource.org/licenses/mit-license.php)
#
# A generator that creates category pages for jekyll sites.
#
# Included filters :
# - category_links:      Outputs the list of categories as comma-separated <a> links.
# - date_to_html_string: Outputs the post.date as formatted html, with hooks for CSS styling.
#
# Available _config.yml settings :
# - category_dir:          The subfolder to build category pages in (default is 'categories').
# - category_title_prefix: The string used before the category name in the page title (default is
#                          'Category: ').

# modified by Alexandre CUER on 14/10/2019 to achieve a multilingual approach

require 'stringex'

module Jekyll

  # The CategoryIndex class creates a single category page for the specified category.
  class CategoryIndex < Page

    # Initializes a new CategoryIndex.
    #
    #  +base+         is the String path to the <source>.
    #  +category_dir+ is the String path between <source> and the category folder.
    #  +category+     is the category currently being processed.
    def initialize(site, base, category_dir, category, lang)
      @site = site
      @base = base
      @dir  = category_dir
      @name = "index#{lang}.html"
      self.process(@name)
      
      # Read the YAML data from the layout page.
      self.read_yaml(File.join(base, '_layouts'), 'category_index.html')
      self.data['category']    = category
      self.data['lang']        = lang
      self.data['ref']         = category
      # Set the title for this page.
      title_prefix             = site.config['category_title_prefix'] || 'Category: '
      self.data['title']       = "#{title_prefix}#{category}"
      # Set the meta-description for this page.
      meta_description_prefix  = site.config['category_meta_description_prefix'] || 'Category: '
      self.data['description'] = "#{meta_description_prefix}#{category}"
    end

  end

  # The CategoryFeed class creates an Atom feed for the specified category.
  class CategoryFeed < Page

    # Initializes a new CategoryFeed.
    #
    #  +base+         is the String path to the <source>.
    #  +category_dir+ is the String path between <source> and the category folder.
    #  +category+     is the category currently being processed.
    def initialize(site, base, category_dir, category, lang)
      @site = site
      @base = base
      @dir  = category_dir
      @name = "atom#{lang}.xml"
      self.process(@name)

      # Read the YAML data from the layout page.
      self.read_yaml(File.join(base, '_includes/custom'), 'category_feed.xml')
      self.data['lang']        = lang
      self.data['category']    = category
      # Set the title for this page.
      title_prefix             = site.config['category_title_prefix'] || 'Category: '
      self.data['title']       = "#{title_prefix}#{category}"
      # Set the meta-description for this page.
      meta_description_prefix  = site.config['category_meta_description_prefix'] || 'Category: '
      self.data['description'] = "#{meta_description_prefix}#{category}"

      # Set the correct feed URL.
      self.data['feed_url'] = "#{category_dir}/#{name}"
    end

  end

  # The Site class is a built-in Jekyll class with access to global site config information.
  class Site

    # Creates an instance of CategoryIndex for each category page, renders it, and
    # writes the output to a file.
    #
    #  +category_dir+ is the String path to the category folder.
    #  +category+     is the category currently being processed.
    def write_category_index(category_dir, category, lang)
      index = CategoryIndex.new(self, self.source, category_dir, category, lang)
      index.render(self.layouts, site_payload)
      index.write(self.dest)
      # Record the fact that this page has been added, otherwise Site::cleanup will remove it.
      self.pages << index

      # Create an Atom-feed for each index.
      feed = CategoryFeed.new(self, self.source, category_dir, category, lang)
      feed.render(self.layouts, site_payload)
      feed.write(self.dest)
      # Record the fact that this page has been added, otherwise Site::cleanup will remove it.
      self.pages << feed
    end

    # Loops through the list of category pages and processes each one.
    def write_category_indexes
      if self.layouts.key? 'category_index'
        dir = self.config['category_dir'] || 'categories'
        self.categories.keys.each do |category|
          warn "generating index for category #{category}"
          langs=self.categories[category].map{|t| t["lang"]}.uniq
          langs.each do |lang|
             warn "got the lang #{lang}"
             self.write_category_index(File.join(dir, category.to_url), category, lang)
          end
        end

      # Throw an exception if the layout couldn't be found.
      else
        raise <<-ERR
===============================================
 Error for category_generator.rb plugin
-----------------------------------------------
 No 'category_index.html' in source/_layouts/
 Perhaps you haven't installed a theme yet.
===============================================
ERR
      end
    end

  end


  # Jekyll hook - the generate method is called by jekyll, and generates all of the category pages.
  class GenerateCategories < Generator
    safe true
    priority :low

    def generate(site)
      site.write_category_indexes
    end

  end


  # Adds some extra filters used during the category creation process.
  module CatFilters

    # Outputs a list of categories as comma-separated <a> links. This is used
    # to output the category list for each post on a category page.
    #
    #  +categories+ is the list of categories to format.
    #
    # Returns string
    #
    def category_links(categories)
      categories = categories.sort!.map { |c| category_link c }

      case categories.length
      when 0
        ""
      when 1
        categories[0].to_s
      else
        categories[0..categories.length].join
        #"#{categories[0...-1].join(', ')}, #{categories[-1]}"
      end
    end

    # Outputs a single category as an <a> link.
    #
    #  +category+ is a category string to format as an <a> link
    #
    # Returns string
    #
    def category_link(category)
      dir = @context.registers[:site].config['category_dir']
      url = @context.registers[:site].config['url']
      baseurl = @context.registers[:site].config['baseurl']
      dir = "#{baseurl}/#{dir}"
      # fetching the language
      lang = @context.environments.first["page"]["lang"]
      warn url
      "<a class='tag' href='#{url}#{dir}/#{category.to_url}/index#{lang}'>#{category}</a>"
    end

    # Outputs the post.date as formatted html, with hooks for CSS styling.
    #
    #  +date+ is the date object to format as HTML.
    #
    # Returns string
    def date_to_html_string(date)
      #result = '<span class="month">' + date.strftime('%b').upcase + '</span> '
      #result += date.strftime('<span class="day">%d</span> ')
      #result += date.strftime('<span class="year">%Y</span> ')
      result = date.strftime("%Y/%m/%d")[0..10]
      #warn result
      result
    end

  end

end

Liquid::Template.register_filter(Jekyll::CatFilters)
