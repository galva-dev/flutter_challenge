class Meal {
  final String name;
  final String weight;
  final String image;

  const Meal({
    required this.name,
    required this.weight,
    required this.image,
  });

  static const meals = [
    Meal(
        name: "Carne 1",
        weight: "150 gr.",
        image:
            "http://www.comedera.com/wp-content/uploads/2014/08/IMG_4792111111.jpg"),
    Meal(
        name: "Carne 2",
        weight: "160 gr.",
        image: "https://dondeviajar.republica.com/files/2011/07/fabada.jpg"),
    Meal(
        name: "Carne 3",
        weight: "70 gr.",
        image:
            "https://viajes.nationalgeographic.com.es/medio/2016/10/05/fabada-asturiana-asturias_7df0ff14.jpg"),
    Meal(
        name: "Carne 4",
        weight: "180 gr.",
        image:
            "https://media-cdn.tripadvisor.com/media/photo-s/0c/3f/2e/b4/fabada-asturiana-2-raciones.jpg"),
    Meal(
        name: "Carne 5",
        weight: "190 gr.",
        image:
            "https://media-cdn.tripadvisor.com/media/photo-s/10/46/36/98/photo1jpg.jpg"),
    Meal(
        name: "Carne 6",
        weight: "110 gr.",
        image:
            "https://media-cdn.tripadvisor.com/media/photo-s/0d/f9/f4/fb/meson-las-cuevas.jpg"),
    Meal(
        name: "Carne 7",
        weight: "120 gr.",
        image:
            "https://www.gastrolabweb.com/u/fotografias/m/2020/7/9/f608x342-1604_31327_0.jpg"),
  ];
}
