class PagesController < ApplicationController

  def about
    #@實體變數，沒有@只是區域變數View抓不到
    @number = (1..42).to_a.sample(5)
  end

end
