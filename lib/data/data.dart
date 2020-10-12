class SliderModel{
  String imagePath;
  String title;
  String desc;
  
  SliderModel({this.imagePath, this.title, this.desc});
  
  void setImageAssetPath(String getImagepath){
    imagePath = getImagepath;
    
  }
  
  void setTitle(String getTitle){
    title = getTitle;
  }
  
  void setDesc(String getDesc){
    desc = getDesc;
  }
  
  String getImageAssetPath(){
    return imagePath;
  }
  
  String getTitle(){
    return title;
  }
  
  String getDesc(){
    return desc;
  }
}

List<SliderModel> getSlides(){
  
  List<SliderModel> slides = new List<SliderModel>();
  
  SliderModel sliderModel = new SliderModel();


  //1st slide
  sliderModel.setImageAssetPath("images/walkthrough1.png");
  sliderModel.setTitle("Lorem ipsum");
  sliderModel.setDesc("lorem ipsum");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2nd slide
  sliderModel.setImageAssetPath("images/walkthrough2.png");
  sliderModel.setTitle("Lorem ipsum2");
  sliderModel.setDesc("lorem ipsum2");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3rd slide
  sliderModel.setImageAssetPath("images/walkthrough3.png");
  sliderModel.setTitle("Lorem ipsum3");
  sliderModel.setDesc("lorem ipsum3");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //4th slide
  sliderModel.setImageAssetPath("images/app_logo.png");
  sliderModel.setTitle("Welcome to GotMySafety");
  sliderModel.setDesc("lorem ipsum");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}