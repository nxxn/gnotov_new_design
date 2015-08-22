class Work < ActiveRecord::Base

  has_attached_file :work_image,
                    :storage => :s3,
                    :styles => { :medium => "540x319#", :thumb => "90x30#", :original => "980x630#" },
                    :convert_options => {:thumb => '-strip -interlace plane -quality 90', :medium => '-strip -interlace plane -quality 90', :original => '-strip -interlace plane -quality 90'},
                    :path => "gnotov_work_images/:id.:style.:extension"

  validates_attachment_content_type :work_image, :content_type => /\Aimage\/.*\Z/

end
