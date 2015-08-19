class Gif < ActiveRecord::Base

  belongs_to  :user
  has_many    :taggings
  has_many    :tags, :through => :taggings
  has_many    :votes

  attachment :file, content_type: "image/gif", extension: "gif"

  validates :image_url, :format => {  :with => /\.gif\z/,
                                      :message => "is not a gif"
                                    }, :allow_blank => true
  validates_uniqueness_of :image_url, :allow_blank => true

  def tag_names
    tags.collect{|t| t.name}.sort_by{|x| x[0]}.reverse
  end

  def self.tagged_with(tag)
    Tag.find_by_name(tag).gifs
  end

  def add_tags(*args)
    args.each do |name|
      name.split(",").collect{|t| t.strip}.each do |tag_name|
        tag = Tag.find_or_initialize_by(name: tag_name)
        tags << tag
      end
    end
  end

end
