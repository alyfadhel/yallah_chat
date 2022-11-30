import 'package:flutter/material.dart';
import 'package:yallah_chat/core/resources/color_manager.dart';
import 'package:yallah_chat/core/resources/icon_broken.dart';
import 'package:yallah_chat/core/resources/values_manager.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: AppSize.s8,
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: AppSize.s5,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                const Image(
                  image: NetworkImage(
                    'https://img.freepik.com/free-photo/happy-stylish-man-casual-clothes-standing-cliff-mountain_158538-13995.jpg?w=900&t=st=1669645576~exp=1669646176~hmac=66ef74847bd76604b02e0d9774b4dff86e999ae204b8f79e6fc6cf73462b86d5',
                  ),
                  width: double.infinity,
                  height: AppSize.s250,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: Text(
                    'Communicate With Friends',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: ColorManager.sWhite,
                        ),
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => buildPostItem(context),
              separatorBuilder: (context, index) => const SizedBox(
                height: AppSize.s10,
              ),
              itemCount: 10,
          ),
          const SizedBox(
            height: AppSize.s10,
          ),
        ],
      ),
    );
  }
}
Widget buildPostItem(context)=>Card(
  clipBehavior: Clip.antiAliasWithSaveLayer,
  margin: const EdgeInsets.symmetric(horizontal: AppSize.s8),
  elevation: AppSize.s5,
  child: Padding(
    padding: const EdgeInsets.all(AppPadding.p10),
    child: Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: AppSize.s25,
              backgroundImage: NetworkImage(
                'https://img.freepik.com/free-photo/happy-young-woman-enjoying-vacation_158595-4298.jpg?w=740&t=st=1669649577~exp=1669650177~hmac=4801a6bc4b4eb5f3a1c41977500d06b07fd65f5afe76c34d8eaaabfe6aa11b69',
              ),
            ),
            const SizedBox(
              width: AppSize.s15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Ali Fadhel Hassan',
                        style: TextStyle(height: 1.3),
                      ),
                      Icon(
                        Icons.verified,
                        color: ColorManager.blue,
                        size: AppSize.s14,
                      ),
                    ],
                  ),
                  Text(
                    'January 21,2022 at 11 pm',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(
                        color: ColorManager.grey,
                        fontSize: AppSize.s12,
                        height: 1.3),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: AppSize.s15,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                size: AppSize.s16,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppSize.s15
          ),
          child: Divider(
            height: AppSize.s1,
            color: ColorManager.grey,
          ),
        ),
        const Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: AppSize.s5,
              bottom: AppSize.s10
          ),
          child: SizedBox(
            width: double.infinity,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      end: AppSize.s8
                  ),
                  child: SizedBox(
                    height: AppSize.s25,
                    child: MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){},
                      minWidth: AppSize.s1,
                      child:  Text(
                        '#software',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color: ColorManager.blue
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      end: AppSize.s8
                  ),
                  child: SizedBox(
                    height: AppSize.s25,
                    child: MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){},
                      minWidth: AppSize.s1,
                      child:  Text(
                        '#flutter',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color: ColorManager.blue
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: AppSize.s250,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppSize.s5,
            ),
            image: const DecorationImage(
              image: NetworkImage(
                'https://img.freepik.com/premium-photo/young-beautiful-cute-sweet-lovely-smiling-woman-with-hold-bouquet-white-fresh-flowers-white-wall-background_158595-8178.jpg?w=900',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSize.s10,
          ),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSize.s5,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          IconBroken.Heart,
                          size: AppSize.s16,
                          color: ColorManager.red,
                        ),
                        const SizedBox(
                          width: AppSize.s5,
                        ),
                        Text(
                          '120',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  onTap: (){},
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSize.s5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          IconBroken.Chat,
                          size: AppSize.s16,
                          color: ColorManager.amber,
                        ),
                        const SizedBox(
                          width: AppSize.s5,
                        ),
                        Text(
                          '120 comments',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  onTap: (){},
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
              bottom: AppSize.s10
          ),
          child: Divider(
            height: AppSize.s1,
            color: ColorManager.grey,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: AppSize.s20,
                      backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/happy-young-woman-enjoying-vacation_158595-4298.jpg?w=740&t=st=1669649577~exp=1669650177~hmac=4801a6bc4b4eb5f3a1c41977500d06b07fd65f5afe76c34d8eaaabfe6aa11b69',
                      ),
                    ),
                    const SizedBox(
                      width: AppSize.s15,
                    ),
                    Text(
                      'Write a comment',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(
                          color: ColorManager.grey,
                          fontSize: AppSize.s12,
                          height: 1.3),
                    ),
                  ],
                ),
                onTap: (){},
              ),
            ),
            InkWell(
              child: Row(
                children: [
                  const Icon(
                    IconBroken.Heart,
                    size: AppSize.s16,
                    color: ColorManager.red,
                  ),
                  const SizedBox(
                    width: AppSize.s5,
                  ),
                  Text(
                    'Like',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
              onTap: (){},
            ),
          ],
        ),

      ],
    ),
  ),
);
