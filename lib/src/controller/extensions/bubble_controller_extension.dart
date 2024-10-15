import 'package:weave_bubble/src/controller/controllers.dart';

extension BubbleControllerExtension on BubbleController {
  BubbleTheme get theme => value.theme;
  BubbleSettings get settings => value.settings;
  List<BubbleStream> get streams => value.streams;
  BubbleInteraction get interaction => value.interaction;

  set interactionState(BubbleInteractionState state) => value =
      value.copyWith(interaction: value.interaction.copyWith(state: state));

  set interactionStateIsActive(bool isActive) =>
      value = value.copyWith(
          interaction: value.interaction.copyWith(
        state: value.interaction.state.copyWith(isActive: isActive),
      ));

  set interaction(BubbleInteraction interaction) =>
      value = value.copyWith(interaction: interaction);

  set preAction(BubbleInteractionAction action) => value = value.copyWith(
      interaction: value.interaction.copyWith(preAction: action));

  set onTapToActivate(BubbleInteractionAction action) => value = value.copyWith(
      interaction: value.interaction.copyWith(onTapToActivate: action));

  set onTapToDeactivate(BubbleInteractionAction action) =>
      value = value.copyWith(
          interaction: value.interaction.copyWith(onTapToDeactivate: action));

  set themeState(BubbleState state) => value = value.copyWith(theme: value.theme.copyWith(state: state));
}
