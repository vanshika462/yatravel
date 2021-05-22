class Option {
  String imageUrl;
  String option;
  String state;

  Option({
    this.imageUrl,
    this.state,
    this.option,
  });
}


List<Option> options = [
  Option(
    imageUrl: 'assets/images/food.jpeg',
    option: 'Food',
  ),
  Option(
    imageUrl: 'assets/images/food.jpeg',
    option: 'Places to Visit',
  ),
  Option(
    imageUrl: 'assets/images/food.jpeg',
    option: 'Local Whispers',
  ),
  Option(
    imageUrl: 'assets/images/food.jpeg',
    option: 'Hotels',

  ),
];