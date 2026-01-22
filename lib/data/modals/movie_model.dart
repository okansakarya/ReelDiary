/// Movie model for mock data
class MovieModel {
  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final String genre;
  final int year;
  final int? minutes;
  final String? subtitle;
  final String? description;

  const MovieModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.genre,
    required this.year,
    this.minutes,
    this.subtitle,
    this.description,
  });

  /// Mock featured movie
  static const MovieModel featured = MovieModel(
    id: 'dune-part-two',
    title: 'Dune: Part Two',
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAHcUskEk4jdQ1k8RZVyfC0s4PiCS2S2oN79ZwI2uPJSKhK3BOiuPTH4CCqvwxTpdsL1AMPvSIhShFouUd4NRbrJrN5aoRIo1MQ04m1gE4Zj7r140y5AvaMDOOTFHs_jrd_AHFknDzhe7LWz_WfVCOeJfgqLXL1d9Z1rcJs7p9iLBF-dQZY0RS_f19a_kumcMclMYluCrRKbGbcTP80-iBeOlt0uyP8O9koxW34Hgi2MDowBEVSQ5jQTPoTkji46VV9l5oU5UVWHLo',
    rating: 9.4,
    genre: 'Sci-Fi',
    year: 2024,
    minutes: 166,
    subtitle: 'The epic continues',
    description: 'Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.',
  );

  /// Mock trending movies
  static const List<MovieModel> trending = [
    MovieModel(
      id: 'oppenheimer',
      title: 'Oppenheimer',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAOKmSlQPmzoj1LqQXK7Y8iNTfOtFZsnkgZK7wLRqUT_Czd6PJUyoHtCVcw03o0sQctoefhjjlJUfYq-bN7dlz0xEwBm_jQv2eaPUua_iS4oJBwhiBBeRoNXO0Y2i5SKFdL8-2ikZnO-OwPAZPTdewFHduYWVU5r5BCBLm9EB_I7G4t1Xu-3YLtM_98wDl0hgJbVIvQqeA848ZHNO9DeS6prQOjNQYkfm0J7lZ-w5ixFxodpC3xpK8izO6pbsjLdV3XCA8yq7T_mug',
      rating: 8.9,
      genre: 'History',
      year: 2023,
    ),
    MovieModel(
      id: 'barbie',
      title: 'Barbie',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBw55L2vtBrKYog64G0Pbk-9IrkTaFYnlv6x70dwsRpsMIFmS_2U3XHvjNSo2iaG30UFJIItxrZjgSvev2eLp3Ha4OMyfx9-0bJK9h-0bK681Wl4I9I2pWQzJZUT748V_gAI8VPFG_br60MU0uZKzDJPC3wAlNjvZANRJ5uWv6HMmfdmApxS6xfchykakzOyJJcKYNGnZwxshJVmZztRWqx339X_zTajWfPWtUBEjZZFrn0PczKalukBQVuTyOxP8xHqNSa2vq7NfI',
      rating: 8.0,
      genre: 'Comedy',
      year: 2023,
    ),
    MovieModel(
      id: 'the-batman',
      title: 'The Batman',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBXmhMX3kU6eJCMgb1Gvtp4ZgqIYG_mysJsycspT5gkeJJxyI2dJPCHG_ywsAen9ZmOUaH1wRUExQ2lakcQe6GxeocF7vTDU1ys48iI5o3tNu0v5RErXydEVRgQi24hip-K--36URvgVLNnMWtYy8DK__f1uL4ZgA2__onTcWLXyAsZDRtOYX58kgAz7ylX-G55xv-_IbPovyhb6lCJuoIU2z_24EhjO63NX0JE9wXMNwJCnDL_M_PXgiFspp0Vxb0hvuTE_Q9bk1M',
      rating: 8.5,
      genre: 'Action',
      year: 2022,
    ),
    MovieModel(
      id: 'spider-man',
      title: 'Spider-Man: Across the Spider-Verse',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAinQEpEw0uFfqxbb2VZ0SFmTA3lxPkjSptlh6aiSalJekOfdsTA5YHRZmcjZz9bUHmqtFHSMMe4HbARMF04rpdF_7wkjJwp5Tv3xDcfk0uqnEho8DhOHmZhm6Arm2ipBzFgasEmaPzRa4in47b_RlM0ogHIW7eGMXFKnMiux86pc4OBEyt5Z3Iobl3F9IaD3txKspS1SnUjjOtGERe1vp7U8WH5bZ4PcDDk31gdUXFNTDTSR9DNlW2FTmNGGGqhcbJr5OlwNxkK-M',
      rating: 9.0,
      genre: 'Animation',
      year: 2023,
    ),
    MovieModel(
      id: 'avatar',
      title: 'Avatar: The Way of Water',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBieZS5rM4ZrO70kndOhnDj6HPDKYtB2vYpuwBTTXcz5O2rP6vLo9x3Dd7aw4nvjgmf3ThKIEha9RisNqDlj3SHr8yZm_1WBSI_khLT4qqmRge2FM8lKVO4hZwKhNxtVdALzb64UqZjFon3uLi-cmw154hrLMvmCuiEbZpdZTcOBEvxqi-r657M3GKginqrWsiVuF8CYWsuawGHTJiGxMuaaQqf-TuGdvReFaWdr0hIbjbWWdlW65uD6Wp3DoiAY8HAGkF3AVGREGc',
      rating: 7.8,
      genre: 'Sci-Fi',
      year: 2022,
    ),
    MovieModel(
      id: 'top-gun',
      title: 'Top Gun: Maverick',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD2KtqKDvVddhvEBUd6MTXHmf6pVGlwf4ValNV9eguAKyVvGUCcd6PwLUNnAIrKQNOx5XTrgWTGTF1oGBu7-I8ujl7wZczq5jMkctMUH-MtH00CUQA6sUeC1AjIOfmdTb_JhvgGvDVAY1HqcpigXVHVtBkAdXvtPcZLPg7jewYXTgobHE8YEiZzi_dE3UJJDn7s4zTdjjdhaM9_DoUQOMNnMXXi2Fbgrr_qhagmseAQ156hzxPj6tWCn2GR7UdDSyoRIeTyoRQLvg8',
      rating: 8.3,
      genre: 'Action',
      year: 2022,
    ),
  ];
}
