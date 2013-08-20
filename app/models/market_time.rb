class MarketTime
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :market

  field :day, type: Integer
  field :start_time, type: Time
  field :end_time, type: Time

  field :start_month, type: Integer
  field :start_day, type: Integer
  field :end_month, type: Integer
  field :end_day, type: Integer

  def self.get_days_array
  	week=[]
  	Time::DAYS_INTO_WEEK.each do |day|
  		day[0]=day[0].to_s.capitalize + "s"
  		week << day
  	end
  	week
  end

  def self.get_months_array
  	year=[]
  	Date::MONTHNAMES.each_with_index do |month, i|
  		unless month.nil?
  		  year << [month, i]
      end
  	end
    year
  end

end
