
# ReelDiary

[TR]
Bu projede portfölyö geliştirme amacıyla Flutter kullanılarak bir mobil uygulama geliştirme amaçlanmıştır. Şuanda geliştirme aşaması devam etmektedir. Projede Bloc kullanılmakta olup 'dio' kütüphanesiyle API işlemleri 'service' ve 'repo'  dosyalarında 'data' katmanında çözülmesi amaçlanmıştır. 

Dosya mimarisi olarak Clean Architecture tercih edilmiştir. Gerekli Login, Logout işlemleri 'supabase' üzerinden gerçekleştirilecektir. 

Ayrıca Firebase ve Crashlytics kullanarak raporlama işlemleri de gerçekleştirilecektir. Push notifiaction ile bildirimler yönetilip kullanıcının güncel kalması hedeflenmektedir.

Proje açık kaynaklı olarak tasarlanmış olup uzun vadede yayınlanması amaçlanmıştır. Proje ilerleme kaydettikçe bu dosya güncellenecektir.

[ENG]

This project aims to develop a mobile application using Flutter for portfolio development purposes. Development is currently ongoing. Bloc is being used in the project, and API operations with the ‘dio’ library are intended to be resolved in the ‘data’ layer in the ‘service’ and ‘repo’ files. 

The Clean Architecture has been chosen for the file architecture. The necessary Login and Logout operations will be performed via ‘supabase’.

Reporting operations will also be performed using Firebase and Crashlytics. Notifications will be managed with push notifications, aiming to keep the user up to date.

The project is designed to be open source and is intended for long-term publication. This file will be updated as the project progresses.






## [TR]
## Güncel Ekran Görüntüleri

https://drive.google.com/file/d/16AMYYav6h3QvDEOpDO3lJIbkAu1y31eF/view?usp=sharing

https://drive.google.com/file/d/1RplvBTXymkJ90L0v8BvLoTemo-kqbmxu/view?usp=sharing


## [ENG]
## Current Screenshots

https://drive.google.com/file/d/16AMYYav6h3QvDEOpDO3lJIbkAu1y31eF/view?usp=sharing

https://drive.google.com/file/d/1RplvBTXymkJ90L0v8BvLoTemo-kqbmxu/view?usp=sharing
  
## File Structure
## Dosya Mimarisi [TR]

.
└── ReelDiary/

    └── lib/
        ├── core/
        │   ├── config/
        │   │   └── -config-files (Supabase-Firebase-Bloc etc)
        │   ├── constants/
        │   │   └── app colors
        │   └── extensions/
        │       └── helpers (String helpers etc)
        ├── data/
        │   ├── modals/
        │   │   └── data entites (modals)
        │   ├── repository/
        │   │   └── service functions
        │   └── service/
        │       └── database / API functions
        └── presentation/
            ├── components/
            │   ├── animations/
            │   │   └── Animations (across the entire application)
            │   ├── widgets/
            │   │   └── UI components (across the entire application)
            │   └── state/
            │       └── Application state (Network Connection etc)
            └── pages/
                └── UI pages/
                    ├── components
                    └── state/
                        └── Bloc (cubit & state)   

## File Structure [ENG]

.
└── ReelDiary/

    └── lib/
        ├── core/
        │   ├── config/
        │   │   └── -config-files (Supabase-Firebase-Bloc etc)
        │   ├── constants/
        │   │   └── app colors
        │   └── extensions/
        │       └── helpers (String helpers etc)
        ├── data/
        │   ├── modals/
        │   │   └── data entites (modals)
        │   ├── repository/
        │   │   └── service functions
        │   └── service/
        │       └── database / API functions
        └── presentation/
            ├── components/
            │   ├── animations/
            │   │   └── Animations (across the entire application)
            │   ├── widgets/
            │   │   └── UI components (across the entire application)
            │   └── state/
            │       └── Application state (Network Connection etc)
            └── pages/
                └── UI pages/
                    ├── components
                    └── state/
                        └── Bloc (cubit & state)   
  
