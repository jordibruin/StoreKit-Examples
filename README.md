# StoreKit Store View Examples
This repo aims to provide sample code for the StoreKit Store and Subscription Store views. You can use them as inspiration for your own paywalls. The goal is to make each option in the StoreView customisable so you can see the effects they have. The repo also aims to recreate common marketing content based on 'proven to be effective' paywalls. 

<img width="2025" alt="image" src="https://github.com/user-attachments/assets/f7685e07-12c2-4cd6-ba78-7235967b9e0f" />


## Benefits of using StoreViews
- [x] Easy to implement
- [x] Localized
- [x] Accessible
- [x] No dependencies

![modes](https://github.com/user-attachments/assets/6778c6b7-e801-4428-a6e3-ae0bb84fea93)

![controlstyles](https://github.com/user-attachments/assets/2310632b-cdf1-4fea-a99a-04744a57bd2b)

![colors](https://github.com/user-attachments/assets/0b3d2a8e-fb10-4965-9d36-70d51af7b94d)

## Todo
- [ ] Add support for all things that can be customised
- [ ] iOS support
- [ ] iPadOS support
- [ ] macOS support
- [ ] visionOS support
- [ ] Figure out a way to make SubscriptionStoreControlStyle customisable

Long unordered list of todos:

[Store Buttons & Labels]

- [x] Allow toggling visibility of Store Buttons (e.g., cancellation, restore, redeem code, policies)
- [x] Support for custom button styling via SwiftUI modifiers
- [x] Add support for color tinting using `.tint()` on StoreKit views and buttons
- [ ] Allow toggling of Store Label styles (.automatic, .action, .prominent, .inline)

[Marketing & Features]
- [ ] Add support for different Marketing Material views (image, video, carousel, text)
- [ ] Display Feature Highlights section using `.storeProductViewStyle(.features)`
- [ ] Allow toggling of feature visibility and layout
- [ ] Include option to show or hide marketing header

[Subscription Options & Groups]
- [x] View to display Subscription Option Group Set
- [x] Toggle between different Subscription Groups (e.g., Streaming Pass vs Streaming Pass Plus)
- [ ] Support for Link-style subscription optio
- [ ] Show examples with one option, two options, three options
- [ ] Display subscription pricing formats (monthly, yearly, family plan, etc.)
- [ ] Add modifiers to detect start and success of purchases

[Offers & Promotions]
- [ ] Include examples with Free Trials
- [ ] Include examples with Promotional Offers
- [ ] Show discounted intro offers vs standard pricing
- [ ] Toggle between offer eligibility states (e.g., eligible, not eligible)

[Visible Relationships & State]
- [ ] Toggle visibility of all `VisibleStoreProduct` relationships (like upgrades, crossgrades)
- [ ] Display how relationship affects UI (e.g., upsell vs neutral)
- [ ] Allow mocking of subscription status (subscribed/unsubscribed)
- [ ] Include environment overrides for locale and storefront

[Multi-View Support]
- [x] Allow switching between multiple StoreKit Views using sidebar toggles
- [x] Group previews with identifiers for easy comparison
- [ ] Support previewing different StoreView variants (.compact, .expanded)

[Debugging & Utilities]
- [ ] Log StoreKit events (e.g., button taps, subscription started, error)
- [ ] Add diagnostics panel to inspect subscription status, product info, transaction history

[Preview & Testing]
- [ ] Allow preview with test products via StoreKit Configuration File
- [ ] Support dynamic product loading via `Product.subscription`
