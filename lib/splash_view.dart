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
  late Animation<double> _scale;
  late Animation<double> _fade;
  late Animation<double> _borderScale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    );

    _scale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.75, curve: Curves.elasticOut)),
    );

    _fade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.4, 1.0, curve: Curves.easeIn)),
    );

    _borderScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.1, 0.8, curve: Curves.easeOutBack)),
    );

    _controller.forward();

    Future.delayed(const Duration(milliseconds: 3000), () {
      if (mounted) context.go('/login');
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
      backgroundColor: const Color(0xFFF8FFED),
      body: Stack(
        children: [
          // خلفية دوائر خفيفة
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
                return Opacity(
                  opacity: _fade.value,
                  child: Transform.scale(
                    scale: _scale.value,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // الإطار الدائري الفاخر بدون صورة
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            // الشادو الخارجي
                            Container(
                              height: 240,
                              width: 240,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 50,
                                    offset: const Offset(0, 25),
                                  ),
                                ],
                              ),
                            ),

                            // الإطار المتحرك
                            AnimatedBuilder(
                              animation: _borderScale,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: _borderScale.value,
                                  child: Container(
                                    height: 230,
                                    width: 230,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF006400),
                                          Color(0xFF008000),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xFF006400).withOpacity(0.4),
                                          blurRadius: 30,
                                          offset: const Offset(0, 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),

                            // الدائرة البيضاء الداخلية
                            Container(
                              height: 210,
                              width: 210,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),

                            // اللوجو الداخلي (نص أو أيقونة)
                            Column(
                              children: [
                                const Icon(
                                  Icons.restaurant_menu_rounded,
                                  size: 80,
                                  color: Color(0xFF006400),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "HUNGRY",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF006400),
                                    letterSpacing: 4,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black.withOpacity(0.3),
                                        offset: const Offset(0, 2),
                                        blurRadius: 6,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 60),

                        // النص
                        Text(
                          "HUNGRY?",
                          style: TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF006400),
                            letterSpacing: 6,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: const Offset(0, 6),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          "The best burgers in town",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // خط تحميل صغير
          Positioned(
            bottom: 80,
            left: 100,
            right: 100,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _fade.value,
                  child: Container(
                    height: 4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: _controller.value,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF006400),
                          borderRadius: BorderRadius.circular(2),
                        ),
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

class _BackgroundPainter extends CustomPainter {
  final double progress;
  _BackgroundPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    paint.color = const Color(0xFF006400).withOpacity(0.08 * progress);
    canvas.drawCircle(Offset(size.width * 0.85, size.height * 0.15), 140 * progress, paint);

    paint.color = const Color(0xFF006400).withOpacity(0.06 * progress);
    canvas.drawCircle(Offset(size.width * 0.15, size.height * 0.8), 160 * progress, paint);
  }

  @override
  bool shouldRepaint(_BackgroundPainter oldDelegate) => true;
}