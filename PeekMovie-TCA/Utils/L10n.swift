// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable function_parameter_count identifier_name line_length type_body_length
public enum L10n {
  /// No messages yet
  public static let chatListChatSummaryLastMessageEmptyPlaceholder = L10n.tr("Localizable", "chatList.chatSummary.lastMessageEmpty.placeholder", fallback: "No messages yet")
  /// No chats found
  public static let chatListEmptyPlaceholder = L10n.tr("Localizable", "chatList.empty.placeholder", fallback: "No chats found")
  /// Mates
  public static let chatListHeaderTitle = L10n.tr("Localizable", "chatList.header.title", fallback: "Mates")
  /// Type...
  public static let chatRoomInputPlaceholder = L10n.tr("Localizable", "chatRoom.input.placeholder", fallback: "Type...")
  /// Online
  public static let chatRoomNavigationBarCompanionOnline = L10n.tr("Localizable", "chatRoom.navigationBar.companionOnline", fallback: "Online")
  /// Confirm
  public static let ownProfileDeleteDialogConfirmButtonTitle = L10n.tr("Localizable", "ownProfileDeleteDialog.confirmButton.title", fallback: "Confirm")
  /// Can we contact you via email?
  public static let ownProfileDeleteDialogFeedbackFieldTitle = L10n.tr("Localizable", "ownProfileDeleteDialog.feedbackField.title", fallback: "Can we contact you via email?")
  /// Number of characters %d/%d
  public static func ownProfileDeleteDialogReasonFieldFooter(_ p1: Int, _ p2: Int) -> String {
    return L10n.tr("Localizable", "ownProfileDeleteDialog.reasonField.footer", p1, p2, fallback: "Number of characters %d/%d")
  }
  /// Why are you leaving us? :(
  public static let ownProfileDeleteDialogReasonFieldTitle = L10n.tr("Localizable", "ownProfileDeleteDialog.reasonField.title", fallback: "Why are you leaving us? :(")
  /// Number of characters %d/%d
  public static func ownProfileEditorAboutTextFieldFooter(_ p1: Int, _ p2: Int) -> String {
    return L10n.tr("Localizable", "ownProfileEditor.aboutTextField.footer", p1, p2, fallback: "Number of characters %d/%d")
  }
  /// About
  public static let ownProfileEditorAboutTextFieldTitle = L10n.tr("Localizable", "ownProfileEditor.aboutTextField.title", fallback: "About")
  /// Done
  public static let ownProfileEditorBirthDatePickerDone = L10n.tr("Localizable", "ownProfileEditor.birthDatePicker.done", fallback: "Done")
  /// Select
  public static let ownProfileEditorBirthDatePickerPlaceholder = L10n.tr("Localizable", "ownProfileEditor.birthDatePicker.placeholder", fallback: "Select")
  /// Birthday date
  public static let ownProfileEditorBirthDatePickerTitle = L10n.tr("Localizable", "ownProfileEditor.birthDatePicker.title", fallback: "Birthday date")
  /// Delete account
  public static let ownProfileEditorDeleteAccountButtonTitle = L10n.tr("Localizable", "ownProfileEditor.deleteAccountButton.title", fallback: "Delete account")
  /// Your gallery
  public static let ownProfileEditorGalleryPickerTitle = L10n.tr("Localizable", "ownProfileEditor.galleryPicker.title", fallback: "Your gallery")
  /// Edit profile
  public static let ownProfileEditorHeaderTitle = L10n.tr("Localizable", "ownProfileEditor.header.title", fallback: "Edit profile")
  /// Selected %d of %d
  public static func ownProfileEditorHobbyPickerNumberOfSelectHobbies(_ p1: Int, _ p2: Int) -> String {
    return L10n.tr("Localizable", "ownProfileEditor.hobbyPicker.numberOfSelectHobbies", p1, p2, fallback: "Selected %d of %d")
  }
  /// Your interests
  public static let ownProfileEditorHobbyPickerTitle = L10n.tr("Localizable", "ownProfileEditor.hobbyPicker.title", fallback: "Your interests")
  /// Number of characters %d/%d
  public static func ownProfileEditorNicknameTextFieldFooter(_ p1: Int, _ p2: Int) -> String {
    return L10n.tr("Localizable", "ownProfileEditor.nicknameTextField.footer", p1, p2, fallback: "Number of characters %d/%d")
  }
  /// Nickname
  public static let ownProfileEditorNicknameTextFieldTitle = L10n.tr("Localizable", "ownProfileEditor.nicknameTextField.title", fallback: "Nickname")
  /// You are
  public static let ownProfileEditorOwnGenderPickerTitle = L10n.tr("Localizable", "ownProfileEditor.ownGenderPicker.title", fallback: "You are")
  /// Save
  public static let ownProfileEditorSaveButtonTitle = L10n.tr("Localizable", "ownProfileEditor.saveButton.title", fallback: "Save")
  /// You are looking for
  public static let ownProfileEditorTargetGendersPickerTitle = L10n.tr("Localizable", "ownProfileEditor.targetGendersPicker.title", fallback: "You are looking for")
  /// Profile verified
  public static let sideProfileOverviewProfileVerified = L10n.tr("Localizable", "sideProfileOverview.profileVerified", fallback: "Profile verified")
  /// Read less
  public static let sideProfileOverviewAboutReadLess = L10n.tr("Localizable", "sideProfileOverview.about.readLess", fallback: "Read less")
  /// Read more
  public static let sideProfileOverviewAboutReadMore = L10n.tr("Localizable", "sideProfileOverview.about.readMore", fallback: "Read more")
  /// About
  public static let sideProfileOverviewAboutTitle = L10n.tr("Localizable", "sideProfileOverview.about.title", fallback: "About")
  /// Gallery
  public static let sideProfileOverviewGalletyTitle = L10n.tr("Localizable", "sideProfileOverview.gallety.title", fallback: "Gallery")
  /// Interests
  public static let sideProfileOverviewHobbiesTitle = L10n.tr("Localizable", "sideProfileOverview.hobbies.title", fallback: "Interests")
  /// Looking for a gender
  public static let sideProfileOverviewTargetGendersTitle = L10n.tr("Localizable", "sideProfileOverview.targetGenders.title", fallback: "Looking for a gender")
  /// 2023 Coffee Mate LTD. All rights reserved. Using this app you confirm your agree with our [Terms of Use](https://www.apple.com/in/) and [Privacy Policy](https://www.apple.com/in/).
  public static let signInFooterMarkdownText = L10n.tr("Localizable", "signIn.footer.markdownText", fallback: "2023 Coffee Mate LTD. All rights reserved. Using this app you confirm your agree with our [Terms of Use](https://www.apple.com/in/) and [Privacy Policy](https://www.apple.com/in/).")
  /// Sign up with your Google account to explore all the valueable features and have touch with your new Coffee Mates
  public static let signInHeaderDescription = L10n.tr("Localizable", "signIn.header.description", fallback: "Sign up with your Google account to explore all the valueable features and have touch with your new Coffee Mates")
  /// Let's Get Started
  public static let signInHeaderTitle = L10n.tr("Localizable", "signIn.header.title", fallback: "Let's Get Started")
  /// Number of characters %d/%d
  public static func signUpAboutStepAboutTextViewNumberOfCharacters(_ p1: Int, _ p2: Int) -> String {
    return L10n.tr("Localizable", "signUp.aboutStep.aboutTextView.numberOfCharacters", p1, p2, fallback: "Number of characters %d/%d")
  }
  /// Thanks to this text, people will get to know you better and understand how much they are interested in you.
  public static let signUpAboutStepHeaderDescription = L10n.tr("Localizable", "signUp.aboutStep.header.description", fallback: "Thanks to this text, people will get to know you better and understand how much they are interested in you.")
  /// Tape a little about yourself
  public static let signUpAboutStepHeaderTitle = L10n.tr("Localizable", "signUp.aboutStep.header.title", fallback: "Tape a little about yourself")
  /// Finish
  public static let signUpAboutStepNextButtonTitle = L10n.tr("Localizable", "signUp.aboutStep.nextButton.title", fallback: "Finish")
  /// Step %d of %d
  public static func signUpFooterStepCounterDescription(_ p1: Int, _ p2: Int) -> String {
    return L10n.tr("Localizable", "signUp.footer.stepCounter.description", p1, p2, fallback: "Step %d of %d")
  }
  /// Next step
  public static let signUpGenderStepNextButtonTitle = L10n.tr("Localizable", "signUp.genderStep.nextButton.title", fallback: "Next step")
  /// You are
  public static let signUpGenderStepOwnGenderPickerTitle = L10n.tr("Localizable", "signUp.genderStep.ownGenderPicker.title", fallback: "You are")
  /// You are looking for
  public static let signUpGenderStepTargetGenderPickerTitle = L10n.tr("Localizable", "signUp.genderStep.targetGenderPicker.title", fallback: "You are looking for")
  /// Create a profile
  public static let signUpHeaderTitle = L10n.tr("Localizable", "signUp.header.title", fallback: "Create a profile")
  /// Select a few of your interests and let everyone know what you're passionate about
  public static let signUpHobbyStepHeaderDescription = L10n.tr("Localizable", "signUp.hobbyStep.header.description", fallback: "Select a few of your interests and let everyone know what you're passionate about")
  /// Your interests
  public static let signUpHobbyStepHeaderTitle = L10n.tr("Localizable", "signUp.hobbyStep.header.title", fallback: "Your interests")
  /// Selected %d of %d
  public static func signUpHobbyStepHobbyPickerNumberOfSelectHobbies(_ p1: Int, _ p2: Int) -> String {
    return L10n.tr("Localizable", "signUp.hobbyStep.hobbyPicker.numberOfSelectHobbies", p1, p2, fallback: "Selected %d of %d")
  }
  /// Next step
  public static let signUpHobbyStepNextButtonTitle = L10n.tr("Localizable", "signUp.hobbyStep.nextButton.title", fallback: "Next step")
  /// Done
  public static let signUpInfoStepBirthDatePickerDone = L10n.tr("Localizable", "signUp.infoStep.birthDatePicker.done", fallback: "Done")
  /// Your birthday date
  public static let signUpInfoStepBirthDatePickerPlaceholder = L10n.tr("Localizable", "signUp.infoStep.birthDatePicker.placeholder", fallback: "Your birthday date")
  /// Fill in a short profile to go on having coffee with mates
  public static let signUpInfoStepHeaderDescription = L10n.tr("Localizable", "signUp.infoStep.header.description", fallback: "Fill in a short profile to go on having coffee with mates")
  /// Next step
  public static let signUpInfoStepNextButtonTitle = L10n.tr("Localizable", "signUp.infoStep.nextButton.title", fallback: "Next step")
  /// Number of characters %d/%d
  public static func signUpInfoStepNicknameTextFieldFooter(_ p1: Int, _ p2: Int) -> String {
    return L10n.tr("Localizable", "signUp.infoStep.nicknameTextField.footer", p1, p2, fallback: "Number of characters %d/%d")
  }
  /// Nickname
  public static let signUpInfoStepNicknameTextFieldTitle = L10n.tr("Localizable", "signUp.infoStep.nicknameTextField.title", fallback: "Nickname")
  /// Profile photo
  public static let signUpInfoStepPhotoPickerTitle = L10n.tr("Localizable", "signUp.infoStep.photoPicker.title", fallback: "Profile photo")
  /// %d days ago
  public static func timeAgoDays(_ p1: Int) -> String {
    return L10n.tr("Localizable", "timeAgo.days", p1, fallback: "%d days ago")
  }
  /// %d hours ago
  public static func timeAgoHours(_ p1: Int) -> String {
    return L10n.tr("Localizable", "timeAgo.hours", p1, fallback: "%d hours ago")
  }
  /// Localizable.strings
  public static func timeAgoMinutes(_ p1: Int) -> String {
    return L10n.tr("Localizable", "timeAgo.minutes", p1, fallback: "%d min ago")
  }
  /// %d months ago
  public static func timeAgoMonths(_ p1: Int) -> String {
    return L10n.tr("Localizable", "timeAgo.months", p1, fallback: "%d months ago")
  }
  /// %d weeks ago
  public static func timeAgoWeeks(_ p1: Int) -> String {
    return L10n.tr("Localizable", "timeAgo.weeks", p1, fallback: "%d weeks ago")
  }
  /// %d years ago
  public static func timeAgoYears(_ p1: Int) -> String {
    return L10n.tr("Localizable", "timeAgo.years", p1, fallback: "%d years ago")
  }
  /// Version %s
  public static func versionDescription(_ p1: UnsafePointer<CChar>) -> String {
    return L10n.tr("Localizable", "version.description", p1, fallback: "Version %s")
  }
}
// swiftlint:enable function_parameter_count identifier_name line_length type_body_length

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
