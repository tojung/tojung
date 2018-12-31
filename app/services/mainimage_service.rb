class MainimageService
  def initialize; end

  def read_last
    mainimage = Mainimage.last

    mainimage0 = mainimage.image0
    mainimage1 = mainimage.image1
    mainimage2 = mainimage.image2
    mainimage3 = mainimage.image3
    mainimage4 = mainimage.image4
    md_link0 = mainimage.md_link0
    md_link1 = mainimage.md_link1

    {
        image0: mainimage0,
        image1: mainimage1,
        image2: mainimage2,
        image3: mainimage3,
        image4: mainimage4,
        md_link0: md_link0,
        md_link1: md_link1
    }
  end

  private
end
