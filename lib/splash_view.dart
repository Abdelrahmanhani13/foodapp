import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.elasticOut),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
      ),
    );

    _rotateAnimation = Tween<double>(begin: 0.0, end: 0.12).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
      ),
    );

    _controller.forward();

    // الانتقال التلقائي بعد 2.8 ثانية (حتى بعد انتهاء الأنيميشن)
    Future.delayed(const Duration(milliseconds: 2800), () {
      if (mounted) {
        context.go('/login'); // أو '/onboarding' أو '/home' حسب اللوجيك بتاعك
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FFED), // نفس لون خلفية التطبيق
      body: Stack(
        children: [
          // خلفية دوائر خفيفة متحركة (أنيميشن خفيف جدًا)
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                size: MediaQuery.of(context).size,
                painter: _BackgroundPainter(_controller.value),
              );
            },
          ),

          // المحتوى الرئيسي
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Transform.rotate(
                    angle: _rotateAnimation.value,
                    child: Opacity(
                      opacity: _fadeAnimation.value,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // البرجر المتحرك
                          Container(
                            height: 220,
                            width: 220,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 40,
                                  offset: const Offset(0, 20),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.network(
                                "https://images.pexels.com/photos/3738730/pexels-photo-3738730.jpeg", // برجر فاخر
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return const CircularProgressIndicator(
                                        color: Color(0xFF006400),
                                      );
                                    },
                              ),
                            ),
                          ),

                          const SizedBox(height: 48),

                          // النص المتحرك
                          Text(
                            "HUNGRY?",
                            style: TextStyle(
                              fontSize: 52,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF006400),
                              letterSpacing: 4,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: const Offset(0, 4),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 12),

                          Text(
                            "The best burgers in town",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // مؤشر تحميل صغير في الأسفل (اختياري)
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimation.value,
                  child: const SizedBox(
                    width: 40,
                    height: 4,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.white24,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF006400),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// رسم خلفية دوائر متحركة خفيفة جدًا (لا تؤثر على الأداء)
class _BackgroundPainter extends CustomPainter {
  final double progress;
  _BackgroundPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // دائرة يمين فوق
    paint.color = const Color(0xFF006400).withOpacity(0.08 * progress);
    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.15),
      120 * progress,
      paint,
    );

    // دائرة يسار تحت
    paint.color = const Color(0xFF006400).withOpacity(0.1 * progress);
    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.85),
      180 * progress,
      paint,
    );

    // دائرة وسط يمين
    paint.color = const Color(0xFF006400).withOpacity(0.06 * progress);
    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.7),
      100 * progress,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
