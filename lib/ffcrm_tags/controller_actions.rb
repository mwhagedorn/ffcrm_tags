module FfcrmTags
  module ControllerActions

    # Controller instance method that responds to /controlled/tagged/tag request.
    # It stores given tag as current query and redirect to index to display all
    # records tagged with the tag.
    #----------------------------------------------------------------------------
    def tagged
      self.send(:current_query=, "#" << params[:id]) unless params[:id].blank?
      redirect_to :action => "index"
    end


    def get_tag_cloud_counts
      @tags = TagAggregator.tag_counts_on(:tags)
    end

    #TODO move to home_controller hook
    #def combined_results
    #
    # records = {
    #  :user  => @current_user,
    #  :order => @current_user.pref[:"#{items}_sort_by"] || klass.sort_by
    #  }
    #  pages = {
    #    :page     => current_page,
    #    :per_page => @current_user.pref[:"#{items}_per_page"]
    #  }
    #
    #  # Call the hook and return its output if any.
    #  @accounts = object_hook("accounts")
    #  @campaigns = object_hook("campaigns")
    #  @contacts = object_hook("contacts")
    #  @leads = object_hook("leads")
    #  @opportunity = object_hook("opportunities")
    #
    #
    #end
    #
    #def object_hook(object_name,records, pages)
    #   hook(:"get_#{object_name}", self, :records => records, :pages => pages)
    #end


  end
end

