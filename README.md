# SimpleWrtcDemo

Example code for the [WebRTC blog](https://arpanghoshal3.medium.com/webrtc-basic-concepts-and-creating-a-simple-video-call-app-1460fc9ef17).

Demo of the working app

![ezgif-4-66fb15a4389c](https://user-images.githubusercontent.com/39219943/133939098-dd9ffcef-545b-428e-90ae-c449746e5dc7.gif)

You need to connect to the WebRTC session from two different browsers, which would then share video and audio P2P using WebRTC.

To start the app
 
  * Clone this repository 
  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Running on Ubuntu (DigitalOcean)

To boot the demo on a fresh Ubuntu server:

1. **Install system dependencies**
   ```bash
   sudo apt update
   sudo apt install -y git curl build-essential nodejs npm erlang elixir
   ```
2. **Clone the project and install Elixir/Node packages**
   ```bash
   git clone https://github.com/<your-account>/ease-video.git
   cd ease-video
   mix local.hex --force
   mix deps.get
   npm --prefix assets install
   ```
3. **Allow web traffic on port 4000** (optional if using UFW)
   ```bash
   sudo ufw allow 4000/tcp
   ```
4. **Start the Phoenix server**
   ```bash
   MIX_ENV=prod mix phx.server
   ```

Navigate to `http://<server-ip>:4000` in your browser to load the app.
