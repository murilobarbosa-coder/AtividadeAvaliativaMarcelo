import 'package:flutter/material.dart';

void main() {
  runApp(const LeadFlowApp());
}

class LeadFlowApp extends StatelessWidget {
  const LeadFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'LeadFlow',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _iconScale;
  late Animation<double> _iconOpacity;
  late Animation<double> _wordmarkOpacity;
  late Animation<Offset> _wordmarkSlide;
  late Animation<double> _taglineOpacity;
  late Animation<Offset> _taglineSlide;
  late Animation<double> _loaderOpacity;
  late Animation<double> _loaderProgress;
  late Animation<double> _versionOpacity;
  late Animation<double> _glowScale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..forward();

    // Icon
    _iconScale = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.03, 0.40, curve: Curves.elasticOut),
      ),
    );
    _iconOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.03, 0.25, curve: Curves.easeOut),
      ),
    );

    // Wordmark
    _wordmarkOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.12, 0.35, curve: Curves.easeOut),
      ),
    );
    _wordmarkSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.12, 0.38, curve: Curves.easeOut),
      ),
    );

    // Tagline
    _taglineOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.20, 0.42, curve: Curves.easeOut),
      ),
    );
    _taglineSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.20, 0.42, curve: Curves.easeOut),
      ),
    );

    // Loader bar
    _loaderOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.30, 0.48, curve: Curves.easeOut),
      ),
    );
    _loaderProgress = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.33, 1.0, curve: Curves.easeInOut),
      ),
    );

    // Version
    _versionOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.38, 0.55, curve: Curves.easeOut),
      ),
    );

    // Background glow pulse (repeating)
    _glowScale = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1A12),
      body: Stack(
        children: [
          // Grid background
          CustomPaint(
            painter: GridPainter(),
            size: Size.infinite,
          ),

          // Glow
          AnimatedBuilder(
            animation: _glowScale,
            builder: (_, __) => Center(
              child: Transform.scale(
                scale: _glowScale.value,
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xFF00C853).withOpacity(0.18),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Main content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon
                AnimatedBuilder(
                  animation: _controller,
                  builder: (_, __) => FadeTransition(
                    opacity: _iconOpacity,
                    child: ScaleTransition(
                      scale: _iconScale,
                      child: Container(
                        width: 88,
                        height: 88,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF00C853), Color(0xFF1DE97A)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF00C853).withOpacity(0.45),
                              blurRadius: 32,
                              spreadRadius: 2,
                            ),
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: CustomPaint(
                          painter: ChartIconPainter(),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // Wordmark
                AnimatedBuilder(
                  animation: _controller,
                  builder: (_, __) => FadeTransition(
                    opacity: _wordmarkOpacity,
                    child: SlideTransition(
                      position: _wordmarkSlide,
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Lead',
                              style: TextStyle(
                                fontFamily: 'sans-serif',
                                fontSize: 44,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFFF0F7F2),
                                letterSpacing: -2,
                                height: 1,
                              ),
                            ),
                            TextSpan(
                              text: 'Flow',
                              style: TextStyle(
                                fontFamily: 'sans-serif',
                                fontSize: 44,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF00C853),
                                letterSpacing: -2,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Tagline
                AnimatedBuilder(
                  animation: _controller,
                  builder: (_, __) => FadeTransition(
                    opacity: _taglineOpacity,
                    child: SlideTransition(
                      position: _taglineSlide,
                      child: const Text(
                        'Transforme contatos em clientes',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0x73F0F7F2),
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 48),

                // Loader bar
                AnimatedBuilder(
                  animation: _controller,
                  builder: (_, __) => FadeTransition(
                    opacity: _loaderOpacity,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 160,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: LinearProgressIndicator(
                              value: _loaderProgress.value,
                              minHeight: 2,
                              backgroundColor: Colors.white.withOpacity(0.08),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFF00C853),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        FadeTransition(
                          opacity: _versionOpacity,
                          child: const Text(
                            'V 1.0.0',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0x30F0F7F2),
                              letterSpacing: 2.5,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom home indicator
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 120,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Grid background painter ──
class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00C853).withOpacity(0.05)
      ..strokeWidth = 0.5;

    const step = 28.0;

    for (double x = 0; x <= size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y <= size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ── Chart icon painter ──
class ChartIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final barPaint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Line chart: 4,32 14,20 22,26 34,10 (scaled to 44x44)
    final path = Path();
    path.moveTo(w * 4 / 44, h * 32 / 44);
    path.lineTo(w * 14 / 44, h * 20 / 44);
    path.lineTo(w * 22 / 44, h * 26 / 44);
    path.lineTo(w * 34 / 44, h * 10 / 44);
    canvas.drawPath(path, linePaint);

    // Circle at end of line
    final dotPaint = Paint()
      ..color = Colors.white.withOpacity(0.9)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(w * 38 / 44, h * 8 / 44), w * 4 / 44, dotPaint);

    // Bar chart columns
    canvas.drawLine(
      Offset(w * 34 / 44, h * 38 / 44),
      Offset(w * 34 / 44, h * 28 / 44),
      barPaint,
    );
    canvas.drawLine(
      Offset(w * 26 / 44, h * 38 / 44),
      Offset(w * 26 / 44, h * 31 / 44),
      barPaint,
    );
    canvas.drawLine(
      Offset(w * 18 / 44, h * 38 / 44),
      Offset(w * 18 / 44, h * 34 / 44),
      barPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
