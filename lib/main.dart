// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// =====================================================================
// STUDENT DETAILS  ->  EDIT THE "FILL_IN" VALUES BEFORE SUBMITTING
// =====================================================================
const String kStudentName = 'Abu Bakar Siddique';
const String kInitials = 'ABS';
const String kStudentId = '2222678';
const String kEmail = '2222678@iub.edu.bd';
const String kPhone = '01944952339';
const String kDepartment = 'CSE';
const String kSemester = 'Autumn 2026';

// =====================================================================
// COLORS
// =====================================================================
const Color kBlue = Color(0xFF2563EB);
const Color kBlueLight = Color(0xFFEFF6FF);
const Color kNavPill = Color(0xFFDBEAFE);
const Color kBg = Color(0xFFF8FAFC);
const Color kInk = Color(0xFF0F172A);
const Color kGrey = Color(0xFF64748B);
const Color kHint = Color(0xFF94A3B8);
const Color kBorder = Color(0xFFE2E8F0);

const Color kRed = Color(0xFFBE123C);
const Color kRedBg = Color(0xFFFFE4E6);
const Color kRedBar = Color(0xFFF43F5E);

const Color kAmber = Color(0xFFB45309);
const Color kAmberBg = Color(0xFFFEF3C7);
const Color kAmberBar = Color(0xFFF59E0B);

const Color kGreen = Color(0xFF047857);
const Color kGreenBg = Color(0xFFD1FAE5);
const Color kGreenTint = Color(0xFFECFDF5);
const Color kGreenBar = Color(0xFF10B981);

const LinearGradient kAvatarGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF60A5FA), Color(0xFF2563EB)],
);

// =====================================================================
// FONTS
//   jakarta() -> Plus Jakarta Sans : headings / bold text
//   inter()   -> Inter             : body / regular text
// =====================================================================
TextStyle jakarta(
  double size, {
  FontWeight weight = FontWeight.w800,
  Color color = kInk,
  double? letterSpacing,
  TextDecoration? decoration,
  Color? decorationColor,
}) {
  return GoogleFonts.plusJakartaSans(
    fontSize: size,
    fontWeight: weight,
    color: color,
    letterSpacing: letterSpacing,
    decoration: decoration,
    decorationColor: decorationColor,
  );
}

TextStyle inter(
  double size, {
  FontWeight weight = FontWeight.w400,
  Color color = kGrey,
}) {
  return GoogleFonts.inter(
    fontSize: size,
    fontWeight: weight,
    color: color,
  );
}

// =====================================================================
// APP ENTRY
// =====================================================================
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: kBlue),
        scaffoldBackgroundColor: kBg,
      ),
      home: const MainScreen(),
    );
  }
}

// =====================================================================
// MAIN SCREEN  (PageView + PageController + BottomNavigationBar)
// =====================================================================
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          TasksPage(),
          ProfilePage(),
          ProgressPage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: kBorder)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (i) {
            FocusManager.instance.primaryFocus?.unfocus();
            setState(() => _currentIndex = i);
            _pageController.jumpToPage(i);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: kBlue,
          unselectedItemColor: kGrey,
          selectedLabelStyle:
              GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w800),
          unselectedLabelStyle:
              GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w500),
          items: const [
            BottomNavigationBarItem(
              icon: _NavIcon(Icons.home_outlined),
              activeIcon: _NavIcon(Icons.home_outlined, active: true),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _NavIcon(Icons.check_box_outlined),
              activeIcon: _NavIcon(Icons.check_box_outlined, active: true),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: _NavIcon(Icons.person_outline_rounded),
              activeIcon: _NavIcon(Icons.person_outline_rounded, active: true),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: _NavIcon(Icons.bar_chart_rounded),
              activeIcon: _NavIcon(Icons.bar_chart_rounded, active: true),
              label: 'Progress',
            ),
          ],
        ),
      ),
    );
  }
}

/// Icon with the light-blue "pill" behind it when the tab is selected.
class _NavIcon extends StatelessWidget {
  final IconData icon;
  final bool active;

  const _NavIcon(this.icon, {this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: active ? kNavPill : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon, size: 26),
    );
  }
}

// =====================================================================
// SHARED WIDGETS
// =====================================================================
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(18),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kBorder),
      ),
      child: child,
    );
  }
}

class GradientAvatar extends StatelessWidget {
  final String text;
  final double size;
  final double fontSize;

  const GradientAvatar({
    super.key,
    required this.text,
    required this.size,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: kAvatarGradient,
      ),
      child: Text(
        text,
        style: jakarta(fontSize, color: Colors.white),
      ),
    );
  }
}

class SquareIconButton extends StatelessWidget {
  final IconData icon;
  final bool showDot;
  final VoidCallback? onTap;

  const SquareIconButton({
    super.key,
    required this.icon,
    this.showDot = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: kBorder),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(icon, color: kInk, size: 22),
            if (showDot)
              Positioned(
                top: 10,
                right: 11,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: kRedBar,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class PageTitleRow extends StatelessWidget {
  final String title;
  final IconData icon;

  const PageTitleRow({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: jakarta(30)),
        SquareIconButton(icon: icon, onTap: () {}),
      ],
    );
  }
}

class PriorityChip extends StatelessWidget {
  final String level;

  const PriorityChip(this.level, {super.key});

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color fg;
    switch (level) {
      case 'High':
        bg = kRedBg;
        fg = kRed;
        break;
      case 'Medium':
        bg = kAmberBg;
        fg = kAmber;
        break;
      default:
        bg = kGreenBg;
        fg = kGreen;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(level, style: jakarta(13, weight: FontWeight.w700, color: fg)),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String action;

  const SectionHeader(this.title, this.action, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26, bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: jakarta(20)),
          Text(
            action,
            style: jakarta(16, weight: FontWeight.w700, color: kBlue),
          ),
        ],
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final double value;
  final Color color;
  final Color trackColor;
  final double height;

  const ProgressBar({
    super.key,
    required this.value,
    required this.color,
    required this.trackColor,
    this.height = 8,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(height),
      child: Container(
        height: height,
        color: trackColor,
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: value.clamp(0.0, 1.0).toDouble(),
          child: Container(color: color),
        ),
      ),
    );
  }
}

// =====================================================================
// PAGE 1 : HOME
// =====================================================================
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  int _selectedDay = 4; // Fri 13

  static const List<String> _dayNames = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];
  static const List<int> _dayNumbers = [9, 10, 11, 12, 13, 14, 15];

  @override
  bool get wantKeepAlive => true;

  Widget _buildDayStrip() {
    return Row(
      children: List.generate(7, (i) {
        final selected = i == _selectedDay;
        return Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => setState(() => _selectedDay = i),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: selected ? kBlue : Colors.transparent,
                borderRadius: BorderRadius.circular(28),
                boxShadow: selected
                    ? const [
                        BoxShadow(
                          color: Color(0x4D2563EB),
                          blurRadius: 14,
                          offset: Offset(0, 6),
                        ),
                      ]
                    : null,
              ),
              child: Column(
                children: [
                  Text(
                    _dayNames[i],
                    style: inter(13, color: selected ? Colors.white : kGrey),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${_dayNumbers[i]}',
                    style: jakarta(
                      20,
                      color: selected ? Colors.white : kInk,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildGoalCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF2563EB), Color(0xFF1E40AF)],
          ),
        ),
        child: Stack(
          children: [
            const Positioned(top: -50, right: -40, child: _Bubble(size: 190)),
            const Positioned(bottom: -90, right: 30, child: _Bubble(size: 170)),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TODAY'S STUDY GOAL",
                    style: jakarta(
                      13,
                      weight: FontWeight.w700,
                      color: const Color(0xFFBFD4FF),
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '2h 15m',
                          style: jakarta(44, color: Colors.white),
                        ),
                        TextSpan(
                          text: ' of 3h',
                          style: jakarta(
                            18,
                            weight: FontWeight.w600,
                            color: const Color(0xFFBFD4FF),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const ProgressBar(
                    value: 0.75,
                    color: Colors.white,
                    trackColor: Color(0x40FFFFFF),
                    height: 10,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '3 tasks due today · 6 day streak',
                    style: inter(16, color: const Color(0xFFDCE7FF)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        children: [
          // Greeting row
          Row(
            children: [
              const GradientAvatar(text: kInitials, size: 46, fontSize: 15),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Good morning,', style: inter(14)),
                    Text(kStudentName, style: jakarta(20)),
                  ],
                ),
              ),
              SquareIconButton(
                icon: Icons.notifications_none_rounded,
                showDot: true,
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 22),
          _buildDayStrip(),
          const SizedBox(height: 22),
          _buildGoalCard(),
          const SectionHeader('Due soon', 'See all'),
          const DueCard(
            title: 'Lab 6: Navigation and routing',
            subtitle: 'CSE 464 · Today, 11:59 PM',
            level: 'High',
            barColor: kRedBar,
          ),
          const SizedBox(height: 12),
          const DueCard(
            title: 'ER diagram for library system',
            subtitle: 'CSE 303 · Tomorrow, 5:00 PM',
            level: 'Medium',
            barColor: kAmberBar,
          ),
          const SectionHeader("Today's classes", 'Timetable'),
          const Row(
            children: [
              Expanded(
                child: ClassCard(
                  time: '10:00 AM',
                  code: 'CSE 464',
                  room: 'Room 7012',
                  bg: kBlueLight,
                  timeColor: kBlue,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ClassCard(
                  time: '1:30 PM',
                  code: 'MAT 212',
                  room: 'Room 3021',
                  bg: kGreenTint,
                  timeColor: kGreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  final double size;

  const _Bubble({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0x1AFFFFFF),
      ),
    );
  }
}

class DueCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String level;
  final Color barColor;

  const DueCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.level,
    required this.barColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 38,
            decoration: BoxDecoration(
              color: barColor,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: jakarta(16, weight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(subtitle, style: inter(14)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          PriorityChip(level),
        ],
      ),
    );
  }
}

class ClassCard extends StatelessWidget {
  final String time;
  final String code;
  final String room;
  final Color bg;
  final Color timeColor;

  const ClassCard({
    super.key,
    required this.time,
    required this.code,
    required this.room,
    required this.bg,
    required this.timeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(time, style: jakarta(17, color: timeColor)),
          const SizedBox(height: 14),
          Text(code, style: jakarta(18)),
          const SizedBox(height: 2),
          Text(room, style: inter(15)),
        ],
      ),
    );
  }
}

// =====================================================================
// PAGE 2 : TASKS
// =====================================================================
class Task {
  final String title;
  final String course;
  final String time;
  final String level;
  final bool urgent;
  bool done;

  Task({
    required this.title,
    required this.course,
    required this.time,
    required this.level,
    this.urgent = false,
    this.done = false,
  });
}

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage>
    with AutomaticKeepAliveClientMixin<TasksPage> {
  String _query = '';

  final List<Task> _today = [
    Task(
      title: 'Lab 6: Navigation and routing',
      course: 'CSE 464',
      time: '11:59 PM',
      level: 'High',
      urgent: true,
    ),
    Task(
      title: 'Read chapter 7: Normalization',
      course: 'CSE 303',
      time: '6:00 PM',
      level: 'Medium',
    ),
    Task(
      title: 'Submit quiz 3 reflection',
      course: 'MAT 212',
      time: '2:00 PM',
      level: 'Low',
      done: true,
    ),
  ];

  final List<Task> _tomorrow = [
    Task(
      title: 'ER diagram for library system',
      course: 'CSE 303',
      time: '5:00 PM',
      level: 'Medium',
    ),
    Task(
      title: 'Watch lecture 9',
      course: 'CSE 464',
      time: '8:00 PM',
      level: 'Low',
    ),
  ];

  @override
  bool get wantKeepAlive => true;

  List<Task> _filter(List<Task> items) {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return items;
    return items
        .where(
          (t) =>
              t.title.toLowerCase().contains(q) ||
              t.course.toLowerCase().contains(q),
        )
        .toList();
  }

  Widget _buildSearch() {
    OutlineInputBorder border(Color c) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: c),
        );
    return TextField(
      onChanged: (v) => setState(() => _query = v),
      style: inter(16, color: kInk),
      decoration: InputDecoration(
        hintText: 'Search tasks, courses...',
        hintStyle: inter(16, color: kHint),
        prefixIcon: const Icon(Icons.search_rounded, color: kHint),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
        border: border(kBorder),
        enabledBorder: border(kBorder),
        focusedBorder: border(kBlue),
      ),
    );
  }

  Widget _buildLabel(String text, int count) {
    return Padding(
      padding: const EdgeInsets.only(top: 26, bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: jakarta(13, color: kGrey, letterSpacing: 1.2)),
          Text(
            '$count TASKS',
            style: jakarta(13, color: kBlue, letterSpacing: 1.0),
          ),
        ],
      ),
    );
  }

  Widget _buildTask(Task t) {
    final timeColor = (t.urgent && !t.done) ? kRed : kGrey;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () => setState(() => t.done = !t.done),
        child: AppCard(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Row(
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: t.done ? kBlue : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: t.done ? kBlue : const Color(0xFFCBD5E1),
                    width: 2,
                  ),
                ),
                child: t.done
                    ? const Icon(Icons.check_rounded,
                        size: 18, color: Colors.white)
                    : null,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.title,
                      style: jakarta(
                        16,
                        weight: FontWeight.w700,
                        color: t.done ? kHint : kInk,
                        decoration:
                            t.done ? TextDecoration.lineThrough : null,
                        decorationColor: kHint,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text.rich(
                      TextSpan(
                        style: inter(14),
                        children: [
                          TextSpan(text: '${t.course} · '),
                          TextSpan(
                            text: t.time,
                            style: TextStyle(color: timeColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              PriorityChip(t.level),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFab() {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Add task (demo)'),
            duration: Duration(seconds: 1),
          ),
        );
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: kBlue,
          borderRadius: BorderRadius.circular(22),
          boxShadow: const [
            BoxShadow(
              color: Color(0x592563EB),
              blurRadius: 18,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: const Icon(Icons.add_rounded, color: Colors.white, size: 34),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final today = _filter(_today);
    final tomorrow = _filter(_tomorrow);

    return SafeArea(
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 110),
            children: [
              const PageTitleRow(
                title: 'Tasks',
                icon: Icons.calendar_today_outlined,
              ),
              const SizedBox(height: 20),
              _buildSearch(),
              if (today.isNotEmpty) ...[
                _buildLabel('TODAY · FRI, 13 NOV', today.length),
                ...today.map(_buildTask),
              ],
              if (tomorrow.isNotEmpty) ...[
                _buildLabel('TOMORROW · SAT, 14 NOV', tomorrow.length),
                ...tomorrow.map(_buildTask),
              ],
            ],
          ),
          Positioned(right: 20, bottom: 20, child: _buildFab()),
        ],
      ),
    );
  }
}

// =====================================================================
// PAGE 3 : PROFILE
// =====================================================================
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin<ProfilePage> {
  bool _notifications = true;
  bool _darkMode = false;
  TimeOfDay _reminder = const TimeOfDay(hour: 20, minute: 0);

  @override
  bool get wantKeepAlive => true;

  Future<void> _pickReminder() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _reminder,
      initialEntryMode: TimePickerEntryMode.dialOnly,
    );
    if (!mounted) return;
    FocusManager.instance.primaryFocus?.unfocus();
    if (picked != null) {
      setState(() => _reminder = picked);
    }
  }

  Widget _valueText(String value) {
    return Text(
      value,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.right,
      style: inter(15, weight: FontWeight.w600),
    );
  }

  Widget _switch(bool value, ValueChanged<bool> onChanged) {
    return Switch(
      value: value,
      onChanged: onChanged,
      thumbColor: const WidgetStatePropertyAll<Color>(Colors.white),
      trackColor: WidgetStateProperty.resolveWith<Color>(
        (states) => states.contains(WidgetState.selected)
            ? kBlue
            : const Color(0xFFE2E8F0),
      ),
      trackOutlineColor:
          const WidgetStatePropertyAll<Color>(Colors.transparent),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    const divider = Divider(height: 1, thickness: 1, color: kBorder);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        children: [
          const PageTitleRow(title: 'Profile', icon: Icons.settings_outlined),
          const SizedBox(height: 22),
          const Center(
            child: GradientAvatar(text: kInitials, size: 78, fontSize: 28),
          ),
          const SizedBox(height: 14),
          Center(child: Text(kStudentName, style: jakarta(24))),
          const SizedBox(height: 4),
          Center(
            child: Text(
              kStudentId,
              style: inter(15, weight: FontWeight.w600),
            ),
          ),
          const SectionHeader('Personal details', ''),
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                SettingsRow(
                  icon: Icons.badge_outlined,
                  label: 'Student ID',
                  trailing: _valueText(kStudentId),
                ),
                divider,
                SettingsRow(
                  icon: Icons.mail_outline_rounded,
                  label: 'Email',
                  trailing: _valueText(kEmail),
                ),
                divider,
                SettingsRow(
                  icon: Icons.phone_outlined,
                  label: 'Phone',
                  trailing: _valueText(kPhone),
                ),
                divider,
                SettingsRow(
                  icon: Icons.menu_book_outlined,
                  label: 'Department',
                  trailing: _valueText(kDepartment),
                ),
                divider,
                SettingsRow(
                  icon: Icons.calendar_month_outlined,
                  label: 'Semester',
                  trailing: _valueText(kSemester),
                ),
              ],
            ),
          ),
          const SectionHeader('Preferences', ''),
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                SettingsRow(
                  icon: Icons.notifications_none_rounded,
                  label: 'Notifications',
                  trailing: _switch(
                    _notifications,
                    (v) => setState(() => _notifications = v),
                  ),
                ),
                divider,
                SettingsRow(
                  icon: Icons.schedule_rounded,
                  label: 'Study reminder',
                  onTap: _pickReminder,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _reminder.format(context),
                        style: inter(16, weight: FontWeight.w600),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.chevron_right_rounded, color: kGrey),
                    ],
                  ),
                ),
                divider,
                SettingsRow(
                  icon: Icons.dark_mode_outlined,
                  label: 'Dark mode',
                  trailing: _switch(
                    _darkMode,
                    (v) => setState(() => _darkMode = v),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Logged out (demo)'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: kBorder),
              ),
              child: Text('Log out', style: jakarta(18, color: kRed)),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget trailing;
  final VoidCallback? onTap;

  const SettingsRow({
    super.key,
    required this.icon,
    required this.label,
    required this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: kBlueLight,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: kBlue, size: 22),
            ),
            const SizedBox(width: 14),
            Text(label, style: jakarta(17, weight: FontWeight.w600)),
            const SizedBox(width: 12),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: trailing,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================================
// PAGE 4 : PROGRESS
// =====================================================================
class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  Widget _weekSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: kBorder),
      ),
      child: Row(
        children: [
          const Icon(Icons.chevron_left_rounded, color: kGrey),
          Expanded(
            child: Center(
              child: Text(
                'This week · 9 to 15 Nov',
                style: jakarta(17, weight: FontWeight.w700),
              ),
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: kGrey),
        ],
      ),
    );
  }

  Widget _statCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String value,
    required String label,
  }) {
    return Expanded(
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(height: 18),
            Text(value, style: jakarta(22)),
            const SizedBox(height: 2),
            Text(label, style: inter(14)),
          ],
        ),
      ),
    );
  }

  Widget _weekCard() {
    return AppCard(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('This week', style: jakarta(20)),
                  const SizedBox(height: 4),
                  Text('9h 21m of 12h goal', style: inter(16)),
                ],
              ),
              Text('78%', style: jakarta(20, color: kBlue)),
            ],
          ),
          const SizedBox(height: 16),
          const ProgressBar(
            value: 0.78,
            color: kBlue,
            trackColor: kBorder,
            height: 12,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: kGreenBg,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.trending_up_rounded, size: 18, color: kGreen),
                const SizedBox(width: 6),
                Text(
                  '+18% vs last week',
                  style: jakarta(15, weight: FontWeight.w700, color: kGreen),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _courseCard({
    required String badge,
    required String title,
    required String next,
    required double percent,
    required Color badgeBg,
    required Color textColor,
    required Color barColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: AppCard(
        child: Row(
          children: [
            Container(
              width: 58,
              height: 58,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: badgeBg,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(badge, style: jakarta(17, color: textColor)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(title, style: jakarta(17))),
                      Text(
                        '${(percent * 100).round()}%',
                        style: jakarta(17, color: textColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(next, style: inter(15)),
                  const SizedBox(height: 12),
                  ProgressBar(
                    value: percent,
                    color: barColor,
                    trackColor: kBorder,
                    height: 8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        children: [
          const PageTitleRow(
            title: 'Progress',
            icon: Icons.calendar_today_outlined,
          ),
          const SizedBox(height: 20),
          _weekSelector(),
          const SizedBox(height: 18),
          Row(
            children: [
              _statCard(
                icon: Icons.schedule_rounded,
                iconColor: kBlue,
                iconBg: kBlueLight,
                value: '9h 21m',
                label: 'Studied',
              ),
              const SizedBox(width: 12),
              _statCard(
                icon: Icons.check_box_outlined,
                iconColor: kGreen,
                iconBg: kGreenBg,
                value: '14',
                label: 'Tasks done',
              ),
              const SizedBox(width: 12),
              _statCard(
                icon: Icons.local_fire_department_outlined,
                iconColor: kAmber,
                iconBg: kAmberBg,
                value: '6 days',
                label: 'Streak',
              ),
            ],
          ),
          const SizedBox(height: 18),
          _weekCard(),
          const SectionHeader('Courses', 'Manage'),
          _courseCard(
            badge: '464',
            title: 'CSE 464 · Mobile Dev',
            next: 'Next: Lab 6, today',
            percent: 0.72,
            badgeBg: kBlueLight,
            textColor: kBlue,
            barColor: kBlue,
          ),
          _courseCard(
            badge: '303',
            title: 'CSE 303 · Databases',
            next: 'Next: ER diagram, Sat',
            percent: 0.58,
            badgeBg: kAmberBg,
            textColor: kAmber,
            barColor: kAmberBar,
          ),
          _courseCard(
            badge: '212',
            title: 'MAT 212 · Linear Algebra',
            next: 'Next: Problem set 4, Mon',
            percent: 0.84,
            badgeBg: kGreenBg,
            textColor: kGreen,
            barColor: kGreenBar,
          ),
        ],
      ),
    );
  }
}
