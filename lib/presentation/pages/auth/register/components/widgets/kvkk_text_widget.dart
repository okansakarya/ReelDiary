import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/utils/screen_utils.dart';

class KvkkTextWidget extends StatelessWidget {
  const KvkkTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenUtils.getScreenHeight(context) * 0.03),
      height: 250,
      width: ScreenUtils.getScreenWidth(context),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'KVKK ŞARTLARI',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.kvkkTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                '1. Genel Bilgiler',
                style: TextStyle(
                  color: AppColors.kvkkTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                '''Bu mobil uygulama, kullanıcıların cilt tipi ve içerik\nbilgilerine göre kozmetik ürünler hakkında bilgi edinmesini ve kişiselleştirilmiş öneriler almasını\nsağlamak amacıyla geliştirilmiştir.Uygulamayı indirip\nkullanarak aşağıdaki şartları kabul etmiş sayılırsınız.''',
                style: TextStyle(
                  color: AppColors.kvkkTextColor,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                '2. Kullanıcı Sorumluluğu',
                style: TextStyle(
                  color: AppColors.kvkkTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                '''Uygulamayı yalnızca yasal amaçlarla kullanabilirsiniz.\nHesap bilgilerinizin gizliliğinden siz sorumlusunuz\nUygulama içeriğini kopyalamak, dağıtmak\nveya kötüye kullanmak yasaktır.''',
                style: TextStyle(
                  color: AppColors.kvkkTextColor,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                '3. Sağlık Beyanı',
                style: TextStyle(
                  color: AppColors.kvkkTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                '''Bu uygulama tıbbi cihaz değildir ve sağlık teşhisi koymaz.Sağlıkla ilgili tavsiyeleryalnızca bilgilendirme\namaçlıdır; cilt hastalıkları için mutlaka bir uzmana danışılmalıdır.''',
                style: TextStyle(
                  color: AppColors.kvkkTextColor,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                '4. İçerik doğruluğu',
                style: TextStyle(
                  color: AppColors.kvkkTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                '''Uygulamada yer alan ürün içerikleri, güvenilir kaynaklardan derlenmiştir.Ancak içeriklerin güncelliği\nve doğruluğu garanti edilmez.Uygulama, üretici markalarla resmi olarak bağlantılı değildir.''',
                style: TextStyle(
                  color: AppColors.kvkkTextColor,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                '5. Değişiklik Hakkı',
                style: TextStyle(
                  color: AppColors.kvkkTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                '''Uygulama sahipleri, herhangi bir zamanda hizmeti değiştirme, durdurmaveya kullanım şartlarını\ngüncelleme hakkını saklı tutar.''',
                style: TextStyle(
                  color: AppColors.kvkkTextColor,
                ),
              ),
            ),
            SizedBox(height: ScreenUtils.getScreenHeight(context) * 0.02),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.buttonColor,
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Kapat',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
