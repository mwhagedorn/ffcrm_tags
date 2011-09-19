class ViewHooks < FatFreeCRM::Callback::Base

  TAGS_STYLES = <<EOS
.tags, .list li dt .tags
  a:link, a:visited
    :background lightsteelblue
    :color white
    :font-weight normal
    :padding 0px 6px 1px 6px
    :-moz-border-radius 8px
    :-webkit-border-radius 8px
  a:hover
    :background steelblue
    :color yellow
#tagcloud
  a, a:visited
    :color black
  .css1,.css2,.css3,.css4
    :color black !important
  .css1
    :font-size 1.0em
  .css2
    :font-size 1.2em
  .css3
    :font-size 1.4em
  .css4
    :font-size 1.6em
.tagged_results
  :margin-top 20px
EOS

  TAGS_JAVASCRIPT = <<EOS
crm.search_tagged = function(query, controller) {
  if ($('query')) {
    $('query').value = query;
  }
  crm.search(query, controller);
}
EOS

  #----------------------------------------------------------------------------
  def inline_styles(view, context = {})
    Sass::Engine.new(TAGS_STYLES).render
  end

  #----------------------------------------------------------------------------
  def javascript_epilogue(view, context = {})
    TAGS_JAVASCRIPT
  end

  #----------------------------------------------------------------------------
  [ :account, :campaign, :contact, :lead, :opportunity ].each do |model|

    define_method :"#{model}_top_section_bottom" do |view, context|
      render_to_string(view,:partial =>"shared/top_section_bottom", :f => context[:f],:model =>context[model], :span =>(model != :campaign ? 3 : 5))
    end

    define_method :"#{model}_bottom" do |view, context|
      unless context[model].tag_list.empty?
        render_to_string(view, :partial =>"shared/bottom", :model => context[model])
      end
    end

    define_method :"show_#{model}_sidebar_bottom" do |view, context|
      unless context[model].tag_list.empty?
        render_to_string(view, :partial =>"shared/show_sidebar_bottom", :model => context[model])
      end
    end

  end
  
  def sidebar_bottom(view,context)
     render_to_string(view, :partial =>"shared/sidebar_bottom")
 
  end

  def tagged_results(view,context)
     render_to_string(view, :partial =>"shared/tagged_results")
  end



   def render_to_string(view,options={})
      partial = options.delete(:partial)
      view.controller.send(:render_to_string,:partial =>partial, :locals =>options)
   end

end
