import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_tammoz_chat/presentation/plantings/pages/add_edit_planting_page.dart';
import 'package:local_tammoz_chat/presentation/plantings/pages/plantings_page.dart';

// استيراد البلوكات و ال Events الخاصة بالتطبيق


class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // شعار المشتل (يمكن استبداله بصورة حقيقية)
            Text('تموز', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            SizedBox(width: 10),
            Icon(Icons.local_florist, color: Colors.white), // أيقونة نبات
          ],
        ),
        backgroundColor: Colors.green.shade700,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // TODO: الذهاب إلى صفحة الإعدادات
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green.shade700),
              child: Text(
                'خيارات',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.local_florist),
              title: Text('عمليات الزراعة'),
              onTap: () {
                Navigator.pop(context); // إغلاق الدرج
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => PlantingsPage()),
                );
              },
            ),
            // يمكنك إضافة المزيد من الخيارات هنا (قص، تطعيم، إلخ)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // شريط العمليات (أزرار رئيسية)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const AddEditPlantingPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text('زراعة'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: إضافة عملية قص
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text('قص'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: إضافة عملية تطعيم
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text('تطعيم'),
                ),
              ],
            ),
            SizedBox(height: 20),



            // لائحة عمليات الزراعة (باستخدام PlantingsPage)

            Expanded(
              child: PlantingsPage(), // تضمين واجهة عمليات الزراعة مباشرة
            ),

            // زر إضافة حجز
            ElevatedButton(
              onPressed: () {
                // TODO: إضافة حجز
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text('إضافة حجز'),
            ),
            SizedBox(height: 20),

            // الحجوزات الموجودة (معلومات تجريبية)
            Text(
              'الحجوزات:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('حجز رقم ${index + 1} - اسم العميل'),
                      subtitle: Text('التاريخ: 2024-06-15، الكمية: 50 شتلة'),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        // TODO: عرض تفاصيل الحجز
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}