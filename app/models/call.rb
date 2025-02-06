class Call < ApplicationRecord
  def set_attributes(params)
    if params[:sid]
      self.id = params[:sid]
      self.assign_attributes(params.except(:sid))
    else
      self.id = params[:callsid]
      self.url = params[:url].to_s.concat(".mp3")
      self.assign_attributes(params.except(:callsid))
    end
  end
end
