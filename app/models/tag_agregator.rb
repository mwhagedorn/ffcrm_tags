class TagAggregator

  @@classlist = [Account, Campaign, Contact, Lead, Opportunity]


  def self.tag_counts_on(tag)
    result={}

    @@classlist.each do |cl|
      temp_result = cl.tag_counts_on(tag).all
      temp_result.each do |tag|
        if result[tag.name]
          #puts "updating #{tag.name} #{tag.count}"
          result[tag.name].count = (result[tag.name].count + tag.count)
          #puts "updated #{tag.name} to #{ result[tag.name].count}"
        else
          #puts "adding #{tag.name}"
          result[tag.name] = tag
        end
      end

    end
    result.values
  end


end
