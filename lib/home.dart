import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_redesign/util/theme_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({
    Key ? key
  }): super(key: key);

  @override
  State < Home > createState() => _HomeState();
}

class _HomeState extends State < Home > {
  final List < String > _servicesIconName = ['youtube', 'gmail', 'google-drive', 'google-meet', 'google-translate'];
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of < ThemeProvider > (context);
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
            child: ListView(
              children: [
                _appBar(themeProvider),
                _googleIcon(),
                _searchField(themeProvider),
                _voice(themeProvider),
                _services(themeProvider),
                _footer(themeProvider)
              ],
            ),
        ),
      ),
    );
  }

  Widget _appBar( ThemeProvider themeProvider) {
    return Container(
      margin: EdgeInsets.only(top: 30. h, left: 40. w, right: 20. w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _menu(),
          Row(
            children: [
              _darkMode(themeProvider),
              SizedBox(width: 15. w, ),
              _userInfo(themeProvider)
            ],
          )

        ],
      ),
    );
  }

  Widget _menu() {
    return SvgPicture.asset('assets/vectors/menu-de-puntos.svg');
  }

  Widget _darkMode( ThemeProvider themeProvider) {
    return FlutterSwitch(
      width: 48.0,
      height: 27.0,
      valueFontSize: 12.0,
      toggleSize: 30.0,
      value: themeProvider.darkTheme,
      padding: 2,
      inactiveColor: const Color(0xffD2D9EA),
        inactiveIcon: SizedBox(
          width: 6. w,
          child: SvgPicture.asset('assets/vectors/moon.svg', )
        ),
        activeIcon: SizedBox(
          width: 8. w,
          child: SvgPicture.asset('assets/vectors/sunny.svg' )
        ),
        onToggle: (val) {
          themeProvider.darkTheme = val;
        },
    );
  }

  Widget _userInfo( ThemeProvider themeProvider) {
    return Container(
      width: 140. w,
      height: 50. h,
      decoration: BoxDecoration(
        color: !themeProvider.darkTheme ?  Colors.white :const Color(0xff202733),
        borderRadius: BorderRadius.circular(50),
        boxShadow: !themeProvider.darkTheme ? const [
          BoxShadow(
            color: Color(0xffE3E8EF),
            blurRadius: 50, // has the effect of softening the shadow
            offset: Offset(
              0.0, // horizontal, move right 10
              2.0, // vertical, move down 10
            ),
          ),
        ] : []
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 15. w, left: 15. w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(image: const AssetImage('assets/images/logo-circle.png'), width: 25. w, height: 25. w, ),
            Text(
              'Mahdi',
              style: TextStyle(
                color: !themeProvider.darkTheme ? const Color(0xff596A91) : Colors.white,
                fontSize: 10. sp
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: const Color(0xff596A91),
              size: 28. sp,
            ),
          ],
        ),
      )
    );
  }

  Widget _googleIcon() {
    return Container(
      margin: EdgeInsets.only(top: 70. h),
      child: SvgPicture.asset('assets/vectors/google.svg')
    );
  }

  Widget _searchField( ThemeProvider themeProvider) {
    return Container(
      margin: EdgeInsets.only(top: 40. h, left: 20. w, right: 20. w),
      child: Material(
        elevation: !themeProvider.darkTheme ? 10 : 0,
        borderOnForeground: false,
        color: Colors.transparent,
        shadowColor: const Color(0xffBFC4DD).withOpacity(0.18),
          borderRadius: BorderRadius.circular(50),
          child: TextField(
            style: TextStyle(height: 1.9, color: Colors.black, fontSize: 15. sp),
            decoration: InputDecoration(
              filled: true,
              prefixIcon: Icon(
                Icons.search_rounded,
                size: 30. sp,
                color: const Color(0xff4285F4),
              ),
              contentPadding: const EdgeInsets.all(15),
              hintText: "Search Google",
            ),
          ),
      )
    );
  }

  Widget _voice( ThemeProvider themeProvider) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30. h),
          height: 130. w,
          width: 130. w,
          padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: !themeProvider.darkTheme ? const Color(0xffFFF9EB) : const Color(0xffE3C47A), width: 2)
            ),
            child: Container(
              padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: !themeProvider.darkTheme ? const Color(0xffEBF3FF) : const Color(0xff5893EA), width: 2)
                ),
                child: Container(
                  padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: !themeProvider.darkTheme ? const Color(0xffFFEBEB) : const Color(0xffE39595), width: 2)
                    ),
                    child: Center(
                      child: SvgPicture.asset('assets/vectors/voice-recorder.svg'),
                    ),
                ),
            )
        ),
        SizedBox(height: 10.h,),
        Text(
          'Your voice assistant...',
          style: TextStyle(
            color: !themeProvider.darkTheme ? Colors.black : Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 14. sp
          ),
        ),
      ],
    );
  }

  Widget _services( ThemeProvider themeProvider) {
    return SizedBox(
      height: 110. h,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10. w, ),
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(left: 20. w, right: 20. w, top: 40. h),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 60. w,
              width: 60. w,
              child: Center(
                child: SvgPicture.asset('assets/vectors/' + _servicesIconName[index] + '.svg'),
              ),
              decoration: !themeProvider.darkTheme ? const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffE3E8EF),
                    blurRadius: 50, // has the effect of softening the shadow
                    offset: Offset(
                      0.0, // horizontal, move right 10
                      2.0, // vertical, move down 10
                    ),
                  )
                ],
              ) : const BoxDecoration(
                color: Color(0xff202733),
                shape: BoxShape.circle,
              )
            );
          },
          itemCount: _servicesIconName.length,
      ),
    );
  }

  Widget _setting( ThemeProvider themeProvider) {
    return Container(
      margin: EdgeInsets.only(left: 40. w, right: 40. w, top: 60. h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.info,
            size: 30. sp,
          ),
          SizedBox(width: 20. w, ),
          Icon(
            Icons.settings,
            size: 30. sp,
          ),
          SizedBox(width: 20. w, ),
          Container(
            width: 170. w,
            height: 55. h,
            decoration: BoxDecoration(
              color: !themeProvider.darkTheme ? const Color(0xffE3E8EF) : const Color(0xff202733),
                borderRadius: BorderRadius.circular(50),
                boxShadow: !themeProvider.darkTheme ?  const [
                  BoxShadow(
                    color: Color(0xffE3E8EF),
                    blurRadius: 50, // has the effect of softening the shadow
                    offset: Offset(
                      0.0, // horizontal, move right 10
                      2.0, // vertical, move down 10
                    ),
                  )
                ]: []
            ),
            child: Padding(
              padding: EdgeInsets.only(right: 15. w, left: 15. w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'English',
                    style: TextStyle(
                      color: !themeProvider.darkTheme ? const Color(0xff596A91) : Colors.white,
                      fontSize: 13. sp
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 35. sp,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _footer(ThemeProvider themeProvider) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _setting(themeProvider),
        SizedBox(height: 50. h, ),
        Padding(
          padding: EdgeInsets.only(left: 30. w, right: 30. w, bottom: 40. h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Privacy',
                style: TextStyle(
                  color: !themeProvider.darkTheme ?const Color(0xff596A91) : Colors.white,
                  fontSize: 14. sp
                ),
              ),
              Text(
                'Conditions',
                style: TextStyle(
                  color: !themeProvider.darkTheme ?const Color(0xff596A91) : Colors.white,
                  fontSize: 14. sp
                ),
              ),
              Text(
                'Preference',
                style: TextStyle(
                  color: !themeProvider.darkTheme ?const Color(0xff596A91) : Colors.white,
                  fontSize: 14. sp
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

}