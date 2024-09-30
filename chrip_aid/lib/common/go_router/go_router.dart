import 'package:chrip_aid/admin/view/admin_accountmanagement_screen.dart';
import 'package:chrip_aid/admin/view/admin_postmanagement_screen.dart';
import 'package:chrip_aid/admin/view/admin_reportmanagement_screen.dart';
import 'package:chrip_aid/auth/model/state/authority_state.dart';
import 'package:chrip_aid/auth/provider/auth_provider.dart';
import 'package:chrip_aid/auth/view/login_screen.dart';
import 'package:chrip_aid/auth/view/orphanage_sign_up_screen.dart';
import 'package:chrip_aid/auth/view/sign_up_screen.dart';
import 'package:chrip_aid/auth/view/user_sign_up_screen.dart';
import 'package:chrip_aid/chatting/view/chatting_message_screen.dart';
import 'package:chrip_aid/chatting/view/chatting_screen.dart';
import 'package:chrip_aid/common/component/custom_detail_post_info.dart';
import 'package:chrip_aid/common/component/custom_detail_report_info.dart';
import 'package:chrip_aid/common/utils/log_util.dart';
import 'package:chrip_aid/root_tab/view/root_tab_screen.dart';
import 'package:chrip_aid/common/view/splash_screen.dart';
import 'package:chrip_aid/management/model/dto/add_orphanage_product_request_dto.dart';
import 'package:chrip_aid/management/view/orphanage_edit_info_screen.dart';
import 'package:chrip_aid/member/view/edit_member_info_screen.dart';
import 'package:chrip_aid/member/view/edit_orphanage_member_info_screen.dart';
import 'package:chrip_aid/member/view/edit_user_info_screen.dart';
import 'package:chrip_aid/orphanage/view/orphanage_basket_screen.dart';
import 'package:chrip_aid/orphanage/view/orphanage_detail_screen.dart';
import 'package:chrip_aid/management/view/orphanage_edit_product_screen.dart';
import 'package:chrip_aid/management/view/orphanage_management_screen.dart';
import 'package:chrip_aid/orphanage/view/orphanage_donate_screen.dart';
import 'package:chrip_aid/orphanage/view/orphanage_map_screen.dart';
import 'package:chrip_aid/orphanage/view/orphanage_search_screen.dart';
import 'package:chrip_aid/post/model/entity/get_posts_entity.dart';
import 'package:chrip_aid/post/view/orphanage_edit_post_screen.dart';
import 'package:chrip_aid/post/view/orphanage_post_screen.dart';
import 'package:chrip_aid/post/view/post_detail_screen.dart';
import 'package:chrip_aid/post/view/post_screen.dart';
import 'package:chrip_aid/post/view/user_post_screen.dart';
import 'package:chrip_aid/reservation/view/orphanage_reservation_screen.dart';
import 'package:chrip_aid/reservation/view/reservation_screen.dart';
import 'package:chrip_aid/reservation/view/user_reservation_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../admin/view/admin_screen.dart';
import '../component/custom_detail_info.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final auth = ref.watch(authProvider);
  final AuthorityState authorityState = AuthorityState();

  String redirectionByAuth(
    BuildContext context,
    GoRouterState state,
    String path,
  ) {
    logging("redirectionByAuth", authorityState.value.toString());
    if (authorityState.value == AuthorityType.user) return '$path/user';
    return '$path/orphanage';
  }

  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/',
        name: RootTab.routeName,
        builder: (context, state) => const RootTab(),
        routes: [
          GoRoute(
            path: 'orphanage',
            builder: (context, state) => const SplashScreen(),
            routes: [
              GoRoute(
                path: 'map',
                name: OrphanageMapScreen.routeName,
                builder: (context, state) => const OrphanageMapScreen(),
              ),
              GoRoute(
                path: 'search',
                name: OrphanageSearchScreen.routeName,
                builder: (context, state) => const OrphanageSearchScreen(),
              ),
              GoRoute(
                path: 'management',
                name: OrphanageManagementScreen.routeName,
                redirect: (context, state) {
                  if (authorityState.value == AuthorityType.orphanage) {
                    return null;
                  }
                  return "/orphanage/map";
                },
                builder: (context, state) => const OrphanageManagementScreen(),
                routes: [
                  GoRoute(
                    path: 'product',
                    name: OrphanageEditProductScreen.routeName,
                    builder: (context, state) => OrphanageEditProductScreen(
                      entity: state.extra as AddOrphanageProductRequestDTO?,
                    ),
                  ),
                  GoRoute(
                    path: 'info',
                    name: OrphanageEditInfoScreen.routeName,
                    builder: (_, __) => const OrphanageEditInfoScreen(),
                  ),
                ],
              ),
              GoRoute(
                path: 'detail',
                name: OrphanageDetailScreen.routeName,
                builder: (context, state) => OrphanageDetailScreen(
                  orphanageId: state.extra as int,
                ),
                routes: [
                  GoRoute(
                    path: 'basket',
                    name: OrphanageBasketScreen.routeName,
                    builder: (context, state) => const OrphanageBasketScreen(),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: 'donate',
            name: OrphanageDonateScreen.routeName,
            builder: (_, __) => const OrphanageDonateScreen(),
          ),
          GoRoute(
            path: 'reservation',
            name: ReservationScreen.routeName,
            redirect: (context, state) =>
                redirectionByAuth(context, state, "/reservation"),
            routes: [
              GoRoute(
                path: 'user',
                builder: (_, __) => const UserReservationScreen(),
              ),
              GoRoute(
                path: 'orphanage',
                builder: (_, __) => const OrphanageReservationScreen(),
              ),
            ],
          ),
          GoRoute(
            path: 'post',
            name: PostScreen.routeName,
            redirect: (context, state) {
              if (state.location.contains('edit')) return null;
              if (state.location.contains('detail')) return null;
              return redirectionByAuth(context, state, "/post");
            },
            routes: [
              GoRoute(
                path: 'user',
                builder: (_, __) => const UserPostScreen(),
              ),
              GoRoute(
                path: 'orphanage',
                builder: (_, __) => const OrphanagePostScreen(),
                routes: [
                  GoRoute(
                    path: 'edit',
                    name: OrphanageEditPostScreen.routeName,
                    redirect: (context, state) {
                      if (authorityState.value == AuthorityType.user) {
                        return '/post';
                      }
                      return null;
                    },
                    builder: (_, __) => const OrphanageEditPostScreen(),
                  ),
                ],
              ),
              GoRoute(
                path: 'detail',
                name: PostDetailScreen.routeName,
                builder: (_, state) =>
                    PostDetailScreen(state.extra as GetPostsEntity),
              ),
            ],
          ),
          GoRoute(
            path: 'member',
            redirect: (context, state) {
              if (state.location.contains('edit')) return null;
              return '/member/edit';
            },
            routes: [
              GoRoute(
                path: 'edit',
                name: EditMemberInfoScreen.routeName,
                redirect: (context, state) =>
                    redirectionByAuth(context, state, "/member/edit"),
                routes: [
                  GoRoute(
                    path: 'user',
                    builder: (context, state) => const EditUserInfoScreen(),
                  ),
                  GoRoute(
                    path: 'orphanage',
                    builder: (context, state) =>
                        const EditOrphanageMemberInfoScreen(),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/splash',
        name: SplashScreen.routeName,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/auth',
        redirect: (context, state) {
          if (state.location.contains('signup')) return null;
          return '/auth/login';
        },
        routes: [
          GoRoute(
            path: 'login',
            name: LoginScreen.routeName,
            builder: (context, state) => const LoginScreen(),
          ),
          GoRoute(
            path: 'signup',
            name: SignUpScreen.routeName,
            redirect: (context, state) =>
                redirectionByAuth(context, state, "/auth/signup"),
            routes: [
              GoRoute(
                path: 'user',
                builder: (context, state) => const UserSignUpScreen(),
              ),
              GoRoute(
                path: 'orphanage',
                builder: (context, state) => const OrphanageSignUpScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/supervisor',
        name: AdminScreen.routeName,
        builder: (context, state) => const AdminScreen(),
        routes: [
          GoRoute(
          path: 'accountmanagement',
          name: AdminAccountmanagementScreen.routeName,
          builder: (context, state) => const AdminAccountmanagementScreen(),
            routes: [
              GoRoute(
                path: 'detail',
                builder: (context, state) {
                  final userData = state.extra as Map<String, dynamic>;
                  return CustomDetailInfo(
                    name: userData['name'],
                    email: userData['email'],
                    phoneNumber: userData['phoneNumber'],
                    nickname: userData['nickname'],
                    age: '20',
                    region: 'Gumi',
                    sex: 'M',
                  );
                },
              ),
            ]
        ),
          GoRoute(
            path: 'postmanagement',
            name: AdminPostmanagementScreen.routeName,
            builder: (context, state) => AdminPostmanagementScreen(),
              routes: [
                GoRoute(
                  path: 'postdetail',
                  builder: (context, state) {
                    final userData = state.extra as Map<String, dynamic>;
                    return CustomDetailPostInfo(
                      title: userData['title'],
                      content: userData['content'],
                      writtenAt: userData['writtenAt'],
                      nickname: userData['nickname'],
                    );
                  },
                ),
          ]
          ),
          GoRoute(
            path: 'reportmanagement',
            name: AdminReportmanagementScreen.routeName,
            builder: (context, state) => const AdminReportmanagementScreen(),
            routes: [
              GoRoute(
                path: 'detail',
                builder: (context, state) {
                  final userData = state.extra as Map<String, dynamic>;
                  return CustomDetailReportInfo(
                    title: userData['title'],
                    target: userData['target'],
                    writtenAt: userData['writtenAt'],
                    nickname: userData['nickname'],
                    content: userData['content'],
                    email: userData['email'],
                  );
                },
              ),
            ],
          ),
        ]
      ),
      GoRoute(
          path: '/chatting',
          name: ChattingScreen.routeName,
          builder: (context, state) => const ChattingScreen(),
          routes: [
            GoRoute(
              path: ':chat_room_id',
              builder: (context, state) {
                final chatRoomId = state.pathParameters['chat_room_id']!;
                final extra = state.extra as Map<String, dynamic>?;
                final targetId = extra?['targetId'] as String? ?? 'Unknown';
                return ChattingMessageScreen(chatRoomId: chatRoomId, targetId: targetId);
              },
            ),
          ]
      ),
    ],
    refreshListenable: auth.authState,
    redirect: auth.redirectLogic,
  );
});
