// ui density
user_pref("browser.compactmode.show", true);
user_pref("browser.uidensity", 1);

// smooth scrolling
user_pref("general.smoothScroll", true);
user_pref("general.smoothScroll.mouseWheel.durationMaxMS", 250);
user_pref("general.smoothScroll.mouseWheel.durationMinMS", 125);
user_pref("mousewheel.min_line_scroll_amount", 22);

// hardware acceleration
user_pref("gfx.webrender.all", true);
user_pref("layers.acceleration.force-enabled", true);

// privacy & telemetry
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("browser.ping-centre.telemetry", false);

// new tab
// set this to false when using New Tab Override extension
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);

// misc ux
user_pref("browser.tabs.closeWindowWithLastTab", false);
user_pref("browser.aboutConfig.showWarning", false);
user_pref("full-screen-api.warning.timeout", 0);
user_pref("browser.ctrlTab.sortByRecentlyUsed", true);
