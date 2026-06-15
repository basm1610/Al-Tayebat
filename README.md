# 🍔 الطيبات | Al-Tayebat

تطبيق توصيل طعام مبني بـ **Flutter** باستخدام **BLoC** لإدارة الحالة، مع بيانات حقيقية من ملف JSON محلي (بدون API).

---

## 📱 لقطات من الشاشات

| الشاشة | الوصف |
|---|---|
| **Home** | الواجهة الرئيسية — عروض مميزة، فئات سريعة، الأكثر مبيعاً |
| **Menu** | قائمة الطعام كاملة مع تاب بار للفئات |
| **Food Detail** | تفاصيل المنتج مع اختيار الحجم والكمية |
| **Cart** | السلة — تعديل الكمية، حذف، الإجمالي |
| **Orders** | تتبع الطلبات السابقة والحالية |
| **Contact Us** | تواصل معنا — العنوان، الهاتف، السوشيال ميديا، الخريطة |

---

## 🏗️ البنية المعمارية (Architecture)

المشروع مقسّم على أساس **Feature-First** + **BLoC Pattern**:

```
lib/
├── main.dart                          # نقطة الدخول — CartBloc في أعلى الشجرة
│
└── features/
    ├── home/
    │   └── presentation/
    │       └── screens/
    │           └── home_screen.dart   # الهوم: عروض + فئات + أكثر مبيعاً
    │
    ├── menu/
    │   ├── bloc/
    │   │   ├── menu_bloc.dart         # منطق تحميل القائمة وتبديل الفئات
    │   │   ├── menu_event.dart        # part of menu_bloc
    │   │   └── menu_state.dart        # part of menu_bloc
    │   ├── data/
    │   │   ├── models/
    │   │   │   ├── menu_category_model.dart
    │   │   │   ├── menu_item_model.dart
    │   │   │   └── item_size_model.dart
    │   │   └── repositories/
    │   │       └── menu_repository.dart   # يقرأ menu.json من assets
    │   └── presentation/
    │       └── screens/
    │           ├── menu_screen.dart       # شاشة القائمة + تاب بار الفئات
    │           └── food_detail_screen.dart # تفاصيل المنتج
    │
    └── cart/
        ├── bloc/
        │   ├── cart_bloc.dart         # منطق السلة (add/remove/qty)
        │   ├── cart_event.dart        # part of cart_bloc
        │   └── cart_state.dart        # part of cart_bloc
        ├── data/
        │   └── models/
        │       └── cart_item_model.dart
        └── presentation/
            └── screens/
                └── cart_screen.dart

assets/
└── data/
    └── menu.json                      # مصدر البيانات الرئيسي
```

---

## ⚙️ التركيب والتشغيل

### 1. المتطلبات (pubspec.yaml)

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.3
  equatable: ^2.0.5

flutter:
  uses-material-design: true
  assets:
    - assets/data/menu.json
  fonts:
    - family: Cairo
      fonts:
        - asset: assets/fonts/Cairo-Regular.ttf
        - asset: assets/fonts/Cairo-Bold.ttf
          weight: 700
```

### 2. التثبيت

```bash
flutter pub get
flutter run
```

---

## 🧠 BLoC Architecture

### MenuBloc

| Event | الوظيفة |
|---|---|
| `LoadMenuEvent({initialCategoryIndex})` | تحميل الفئات من JSON، مع تحديد الفئة الافتراضية المعروضة |
| `SelectCategoryEvent(index)` | تبديل الفئة المختارة في التاب بار |

| State | الوصف |
|---|---|
| `MenuInitial` | الحالة الأولية |
| `MenuLoading` | جاري التحميل |
| `MenuLoaded` | تم التحميل — يحتوي على `categories` و `selectedCategoryIndex` |
| `MenuError` | حدث خطأ |

### CartBloc

| Event | الوظيفة |
|---|---|
| `AddToCartEvent(item, size)` | إضافة منتج — لو موجود بنفس الحجم يزيد الكمية |
| `IncrementQuantityEvent(key)` | زيادة الكمية |
| `DecrementQuantityEvent(key)` | تقليل الكمية (يحذف لو وصلت لـ 0) |
| `RemoveFromCartEvent(key)` | حذف منتج بالكامل |
| `ClearCartEvent()` | تفريغ السلة |

`CartState` يوفر: `totalItems`, `totalPrice`, `isEmpty`.

> **ملاحظة:** `CartBloc` مزروع في `main.dart` فوق كل التطبيق عشان يكون متاح من أي شاشة (Home, Menu, FoodDetail, Cart) بدون إعادة إنشاء.

---

## 🔗 التنقل بين الشاشات (Navigation Flow)

```
HomeScreen
 ├─ Category Chip / Featured Offer  ──▶  MenuScreen(initialCategoryIndex: X)
 ├─ Best Seller Card                ──▶  FoodDetailScreen(item)
 ├─ Cart Icon (AppBar)              ──▶  CartScreen
 │
MenuScreen
 ├─ Category Tab Bar                ──▶  يبدّل المنتجات المعروضة فوراً (نفس الشاشة)
 ├─ زر "+" على أي منتج              ──▶  AddToCartEvent مباشرة
 │
FoodDetailScreen
 ├─ اختيار الحجم + الكمية
 └─ "إضافة للسلة"                   ──▶  AddToCartEvent + رجوع للخلف
```

---

## 📦 بيانات القائمة (menu.json)

شكل البيانات:

```json
{
  "categories": [
    {
      "id": 1,
      "name": "سندوتشات الدجاج",
      "items": [
        {
          "id": 101,
          "name": "تشيكن هوت",
          "sizes": [
            { "name": "Regular", "price": 150 },
            { "name": "Medium", "price": 200 },
            { "name": "Large", "price": 245 }
          ]
        }
      ]
    }
  ]
}
```

- كل **Category** له `id`, `name`, و `items[]`
- كل **Item** له `id`, `name`, و `sizes[]`
- كل **Size** له `name` و `price`
- المنتجات بحجم واحد فقط (`Standard`) لا تظهر لها أزرار اختيار حجم

---

## ⭐ الأكثر مبيعاً (Best Sellers)

يتم التحكم فيها من ثابت واحد في `home_screen.dart`:

```dart
const List<int> kBestSellerIds = [101, 302, 401, 503, 601, 108, 205];
```

الكود يبحث عن هذه الـ IDs داخل كل الفئات ويعرضها بنفس الترتيب. لإضافة/حذف منتج من القسم، فقط عدّل هذه القائمة.

---

## 🎨 الألوان الأساسية (Design Tokens)

| الاستخدام | الكود |
|---|---|
| الخلفية الأساسية | `#121212` |
| خلفية الكروت | `#1E1E1E` / `#1A1A1A` |
| اللون البرتقالي (Primary) | `#E07B2A` / `#E8B94F` |
| النص الثانوي | `Colors.white54` / `white38` |
| الخط | `Cairo` |

---

## 🚧 خطوات قادمة (TODO)

- [ ] ربط شاشة `OrdersScreen` بـ `OrderBloc` وبيانات حقيقية
- [ ] حفظ السلة محلياً (Hive / SharedPreferences) لمنع فقدها عند إغلاق التطبيق
- [ ] شاشة Checkout لإتمام الطلب من `CartScreen`
- [ ] دعم البحث الفعلي في `_SearchBarWidget`
- [ ] استبدال صور Unsplash بصور المنتجات الحقيقية (assets محلية)
- [ ] شاشة Login / Account

---

## 📄 الترخيص

هذا المشروع لأغراض التطوير الداخلي لمطعم **الطيبات**.
