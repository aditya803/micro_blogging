class RecommendedModel {
  String name;
  String image;
  RecommendedModel(this.name,this.image);
}

List<RecommendedModel> recommendations= recommendationsData
    .map((item)=>RecommendedModel(item['name'],item['image']))
    .toList();

var recommendationsData = [
  {
    "name": "Technical Blogs.",
    "image": "https://mk0gamegavelcomf2jqu.kinstacdn.com/wp-content/uploads/2019/07/magic-laptop.jpg"
  },
  {
    "name": "Fashion Blogs.",
    "image": "https://cordmagazine.com/wp-content/uploads/2017/07/Emporio-Armani-776x430.jpg"
  },
  {
    "name": "Food Blogs",
    "image": "https://iadsb.tmgrup.com.tr/bad6a2/1200/627/0/68/1000/590?u=https://idsb.tmgrup.com.tr/2019/12/09/1575888943332.jpg"
  },
  {
    "name": "Travel Blogs.",
    "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR3Kznb_2xXI0jGm8_NNuCw7AbuO6YT47xBQw&usqp=CAU"
  },
  {
    "name": "Music Blogs",
    "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTZclSbax2QI9VFCYiLh0PAvwVUy-hUTL4nDg&usqp=CAU"
  },
  {
    "name": "Lifestyle Blogs",
    "image": "https://miro.medium.com/max/875/0*ssJPCpwd31EmxIRY"
  },
  {
    "name": "Fitness Blogs",
    "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRpyG8ugyxMqigO688lFaGjh2I7YEsi4Cek4g&usqp=CAU"
  },
  {
    "name": " DIY Blogs",
    "image": "https://www.workstore.com.sg/space/wp-content/uploads/2017/07/diy.png"
  },
];