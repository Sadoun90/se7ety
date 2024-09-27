class OnBoardingModel {
  final String image;
  final String title;
  final String body;
  OnBoardingModel(
      {required this.body, required this.image, required this.title});
}

List<OnBoardingModel> pages = [
  OnBoardingModel(
      image: 'assets/images/on1.svg',
      title: 'ابحث عن دكتور متخصص',
      body:
          'اكتشف مجموعة واسعة من الاطباء الخبراء والمتخصصين فى كافة المجالات'),
  OnBoardingModel(
      image: 'assets/images/on2.svg',
      title: 'سهولة الحجز',
      body: 'احجز المواعيد بضغطة زرار فى اي وقت وفي اى مكان'),
  OnBoardingModel(
      image: 'assets/images/on3.svg',
      title: ' امن و سري',
      body: ' كن مطمئنا لان خصوصيتك وامانك هما اهم اولوياتنا'),
];
