import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/utils/screen_utils.dart';

class KvkkTextWidget extends StatelessWidget {
  const KvkkTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textPrim = AppColors.textPrimary(context);
    final textSec = AppColors.textSecondary(context);
    final primary = AppColors.primary(context);

    return Container(
      padding: EdgeInsets.all(ScreenUtils.getScreenHeight(context) * 0.03),
      height: 250,
      width: ScreenUtils.getScreenWidth(context),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'KVKK ŞARTLARI',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textPrim,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '1. Genel Bilgiler',
                style: TextStyle(
                  color: textPrim,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '''Bu mobil uygulama, kullanıcıların cilt tipi ve içerik
bilgilerine göre kozmetik ürünler hakkında bilgi edinmesini ve kişiselleştirilmiş öneriler almasını
sağlamak amacıyla geliştirilmiştir. Uygulamayı indirip
kullanarak aşağıdaki şartları kabul etmiş sayılırsınız.''',
                style: TextStyle(color: textSec),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '2. Kullanıcı Sorumluluğu',
                style: TextStyle(
                  color: textPrim,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '''Uygulamayı yalnızca yasal amaçlarla kullanabilirsiniz.
Hesap bilgilerinizin gizliliğinden siz sorumlusunuz.
Uygulama içeriğini kopyalamak, dağıtmak
veya kötüye kullanmak yasaktır.''',
                style: TextStyle(color: textSec),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '3. Sağlık Beyanı',
                style: TextStyle(
                  color: textPrim,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '''Bu uygulama tıbbi cihaz değildir ve sağlık teşhisi koymaz.
Sağlıkla ilgili tavsiyeler yalnızca bilgilendirme
amaçlıdır; cilt hastalıkları için mutlaka bir uzmana danışılmalıdır.''',
                style: TextStyle(color: textSec),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '4. İçerik doğruluğu',
                style: TextStyle(
                  color: textPrim,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '''Uygulamada yer alan ürün içerikleri, güvenilir kaynaklardan derlenmiştir.
Ancak içeriklerin güncelliği ve doğruluğu garanti edilmez.
Uygulama, üretici markalarla resmi olarak bağlantılı değildir.''',
                style: TextStyle(color: textSec),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '5. Değişiklik Hakkı',
                style: TextStyle(
                  color: textPrim,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '''Uygulama sahipleri, herhangi bir zamanda hizmeti değiştirme, durdurma
veya kullanım şartlarını güncelleme hakkını saklı tutar.''',
                style: TextStyle(color: textSec),
              ),
            ),
            SizedBox(height: ScreenUtils.getScreenHeight(context) * 0.02),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: primary,
                ),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Kapat',
                  style: TextStyle(color: textPrim),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
