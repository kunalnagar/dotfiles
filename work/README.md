# How I setup a new work laptop

Thumb rule: No personal data / logins on a work laptop

Here are some things I do to keep my experience on my work laptop consistent:

1. Rename the machine to `Kunal_Work` and assign an IP of `192.168.0.10`
2. Clone the dotfiles repo and run the work installer script
   ```
   xcode-select --install
   git clone https://github.com/kunalnagar/dotfiles.git ~/.dotfiles
   ```

## What's included

Here's a list of things that get installed:

- Install latest updates
- Set Finder defaults
- Set fast key repeat
- Disable automatic updates
- Homebrew
- nvm and node LTS
- Git bash completion script
- Custom `.bash_profile`
- Symlink Profile picture to use in ~/Pictures
- Symlink Wallpaper and flipped version for dual monitor sync
- Symlink Terminal Settings

### Apps (usually installed via Homebrew)

1. Bartender
2. Rectangle
3. Alfred
   - Update shortcut to Cmd + Shift + Space
4. Google Chrome
5. Visual Studio Code
6. Zoom (optional)
7. AppCleaner (Freemacsoft)
8. Docker

### Setup Google Chrome

- Create a work profile called "Kunal (<company_name>)"
  - Install [uBlock origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en)
  - Install [React DevTools](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi?hl=en)
  - Install [Zoom for GSuite](https://workspace.google.com/marketplace/app/zoom_for_g_suite/364750910244)
  - Set Gmail, Calendar, Spotify as pinned tabs

### Setup Gmail

- Setup profile picture: ~/Pictures/me.jpg
- Import the following filters: GitHub
- Settings > Labels > "show if unread" for labels above
- Settings > Density > Comfortable
- Here are the options that should show by default:
  - Inbox, Starred, Sent, Drafts, All Mail
- Set Signature:
  ```
  Best,
  Kunal Nagar
  <position> | <company_name>
  Join us: <careers_page>
  ```
- Set Vacation Responder Text

  ```
  Hello,

  You've reached Kunal. The bad news is that I'm out of office. The good news is that I'm out of office.

  If the world is about to end, you should rethink your decision about emailing me.
  If this is truly an emergency, please reach out to my manager <manager_name>.

  Best,
  Kunal Nagar
  ```

- Calendar
  - Week view by default
  - Display secondary timezone
  - Reduce brightness of past events
  - Event Settings (50 mins): This gives folks 10 mins back to recharge before the next one in case of a meeting wall
  - Start week on Monday
  - Working hours: 9:30am - 5:30pm EST

### Setup Zoom

For the different Setting tabs, the ones listed should be checked, rest all are unchecked. Also, take a look at the web settings.

- Setup profile picture: ~/Pictures/me.jpg
-
- General
  - Ask me to confirm when I leave a meeting
  - Show user profile icon next to in-meeting chat messages
  - Theme: Light
- Video
  - Camera: HD, Mirror my video
  - My Video: Adjust for low light (Auto)
  - Always show video preview dialog when joining a video meeting
  - Max participants: 25
  - Advanced:
    - Optimize video quality with de-noise
    - Use hardware acceleration for receiving video
  - Audio
    - Automatically adjust microphone volume
    - Suppress background noise (Auto)
    - Automatically join computer audio when joining a meeting
    - Mute my mic when joining a meeting
    - Sync buttons on headset
  - Share Screen
    - Maintain current size
    - Scale to fit shared content to Zoom window
    - Side-by-side mode
    - Silence System notifications when sharing desktop
    - Share applications
      - Share individual window
    - When I share my screen in a meeting
      - Show all sharing options
    - When I share directly to a Zoom Room
      - Show all sharing options
    - Advanced
      - Show green border around the shared content
      - Use hardware acceleration to optimize video sharing
- Chat
  - Show Record Button
  - Show link preview
  - Change my status to away when I'm inactive for 15 mins
  - Bounce application icon when recieving a new message "Once"
  - Left sidebar theme: Default
  - When viewing unread messages in a channel: Start at the first unread
  - Push notifications: All messages
  - Mute chat notifications while I am in a meeting or internal call
  - Show message preview (this overrides the system preferences)
- Background & Filters:
  - Blur, Mirror my video
- Recording
  - Uncheck all
