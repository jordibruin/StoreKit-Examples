# StoreKit Store View Examples
This repo aims to provide sample code for the StoreKit Store and Subscription Store views. You can use them as inspiration for your own paywalls. The goal is to make each option in the StoreView customisable so you can see the effects they have. The repo also aims to recreate common marketing content based on 'proven to be effective' paywalls. 

<img width="1511" alt="image" src="https://github.com/user-attachments/assets/18a4a4d6-0543-45b3-8499-4dda391ef55e">

## Benefits of using StoreViews
- [x] Easy to implement
- [x] Localized
- [x] Accessible
- [x] No dependencies

## Todo
- [ ] Add support for all things that can be customised
- [ ] iOS support
- [ ] iPadOS support
- [ ] macOS support
- [ ] visionOS support
- [ ] Figure out a way to make SubscriptionStoreControlStyle customisable

Long unordered list of todos:

[Store Buttons & Labels]

- [ ] Allow toggling visibility of Store Buttons (e.g., cancellation, restore, redeem code, policies)
- [ ] Allow toggling of Store Label styles (.automatic, .action, .prominent, .inline)
- [ ] Include toggle for button placement (e.g., top, bottom)
- [ ] Support for custom button styling via SwiftUI modifiers
- [ ] Add support for color tinting using `.tint()` on StoreKit views and buttons

[Marketing & Features]
- [ ] Add support for different Marketing Material views (image, video, carousel, text)
- [ ] Display Feature Highlights section using `.storeProductViewStyle(.features)`
- [ ] Allow toggling of feature visibility and layout
- [ ] Include option to show or hide marketing header

[Subscription Options & Groups]
- [ ] View to display Subscription Option Group Set
- [ ] Toggle between different Subscription Groups (e.g., Streaming Pass vs Streaming Pass Plus)
- [ ] Support for Link-style subscription optio
- [ ] Show examples with one option, two options, three options
- [ ] Display subscription pricing formats (monthly, yearly, family plan, etc.)

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
- [ ] Allow switching between multiple StoreKit Views using sidebar toggles
- [ ] Allow switching between multiple StoreKit Groups using sidebar toggles
- [ ] Support previewing different StoreView variants (.compact, .expanded)
- [ ] Group previews with identifiers for easy comparison

[Debugging & Utilities]
- [ ] Show output of current StoreKit configuration in JSON
- [ ] Log StoreKit events (e.g., button taps, subscription started, error)
- [ ] Include a toggle for simulated purchase flow vs real
- [ ] Add diagnostics panel to inspect subscription status, product info, transaction history

[Preview & Testing]
- [ ] Add SwiftUI previews for all combinations of views
- [ ] Allow preview with test products via StoreKit Configuration File
- [ ] Support dynamic product loading via `Product.subscription`
