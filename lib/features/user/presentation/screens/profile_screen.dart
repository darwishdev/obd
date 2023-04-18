import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:obd/core/repositories/token_repository.dart';
import 'package:obd/features/user/presentation/provider/user_login_provider.dart';
import 'package:obd/features/user/presentation/widgets/list_tile_lnk_widget.dart';
import 'package:obd/routes/app_router.gr.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              ClipOval(
                child: CircleAvatar(
                  radius: 75,
                  child: Image.asset('assets/images/profile.jpg'),
                ),
              ),
              const SizedBox(height: 15),
              Consumer(builder: (context, ref, child) {
                final repo = ref.watch(tokenRepositoryProvider);
                return Text(
                  repo.userInfo?.user?.name ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
              const SizedBox(height: 50),
              ListTileInkWidget(
                child: ListTile(
                  leading: SvgPicture.asset(
                    "assets/images/car.svg",
                    width: 30,
                    height: 30,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: const Text("Car Info"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => context.router.push(const EditCarRoute()),
                ),
              ),
              const Divider(),
              ListTileInkWidget(
                child: ListTile(
                  leading: SvgPicture.asset(
                    "assets/images/review.svg",
                    width: 30,
                    height: 30,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: const Text("Your Reviews"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => context.router.push(const ReviewsRoute()),
                ),
              ),
              const Divider(),
              ListTileInkWidget(
                child: ListTile(
                  leading: SvgPicture.asset(
                    "assets/images/review.svg",
                    width: 30,
                    height: 30,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: const Text("Add Review"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => context.router.push(CreateReviewRoute()),
                ),
              ),
              const Divider(),
              ListTileInkWidget(
                child: ListTile(
                  leading: SvgPicture.asset(
                    "assets/images/connect.svg",
                    width: 30,
                    height: 30,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: const Text("Connect"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => context.router.push(const ConnectPage()),
                ),
              ),
              const Divider(),
              Consumer(builder: (context, ref, child) {
                return ListTileInkWidget(
                  child: ListTile(
                    leading: SvgPicture.asset(
                      "assets/images/logout.svg",
                      width: 30,
                      height: 30,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    title: const Text("Sign out"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      ref.read(userLoginProvider.notifier).logout().then((v) {
                        context.router.replaceAll([const LoginRoute()]);
                      });
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
