<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MY PROFILE</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --idol-pink: #FF9EB5;
            --idol-dark-pink: #E83D84;
            --idol-light-pink: #FFD6E0;
            --idol-white: #FFF9FA;
            --idol-gray: #D8BFC7;
            --idol-dark: #5A2D41;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial Rounded MT Bold', 'Arial', sans-serif;
        }

        body {
            color: var(--idol-dark);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: linear-gradient(rgba(255, 255, 255, 0.7), rgba(255, 255, 255, 0.7)),
                        url('https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80') no-repeat center center fixed;
            background-size: cover;
            position: relative;
            overflow-x: hidden;
        }

        .tap-to-start {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 158, 181, 0.9);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            z-index: 1000;
            backdrop-filter: blur(10px);
            transition: all 1s ease-out;
        }

        .tap-to-start.hide {
            opacity: 0;
            visibility: hidden;
            backdrop-filter: blur(0);
        }

        .tap-content {
            text-align: center;
            transform: scale(0.9);
            opacity: 0;
            animation: fadeIn 0.5s ease-out forwards;
        }

        @keyframes fadeIn {
            to {
                transform: scale(1);
                opacity: 1;
            }
        }

        .tap-button {
            background-color: var(--idol-white);
            color: var(--idol-dark-pink);
            border: none;
            padding: 20px 50px;
            border-radius: 50px;
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s;
            box-shadow: 0 10px 30px rgba(232, 61, 132, 0.3);
            animation: pulse 1.5s infinite;
            position: relative;
            overflow: hidden;
            border: 3px solid var(--idol-white);
        }

        .tap-button:hover {
            background-color: var(--idol-dark-pink);
            color: var(--idol-white);
            box-shadow: 0 15px 40px rgba(232, 61, 132, 0.5);
        }

        .tap-button::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 5px;
            height: 5px;
            background: rgba(255, 255, 255, 0.5);
            opacity: 0;
            border-radius: 100%;
            transform: scale(1, 1) translate(-50%, -50%);
            transform-origin: 50% 50%;
        }

        .tap-button:active::after {
            animation: ripple 1s ease-out;
        }

        @keyframes ripple {
            0% {
                transform: scale(0, 0);
                opacity: 1;
            }
            100% {
                transform: scale(20, 20);
                opacity: 0;
            }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .content {
            opacity: 0;
            transform: translateY(20px);
            transition: all 0.8s ease-out;
        }

        .content.show {
            opacity: 1;
            transform: translateY(0);
        }

        header {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px 30px;
            backdrop-filter: blur(10px);
            position: sticky;
            top: 0;
            z-index: 100;
            text-align: center;
            border-bottom: 1px solid var(--idol-gray);
            box-shadow: 0 2px 15px rgba(90, 45, 65, 0.1);
        }

        .logo {
            font-size: 32px;
            font-weight: bold;
            color: var(--idol-dark-pink);
            letter-spacing: 2px;
            text-shadow: 0 2px 5px rgba(255, 158, 181, 0.3);
        }

        main {
            padding: 30px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: rgba(255, 255, 255, 0.5);
            backdrop-filter: blur(5px);
            flex-grow: 1;
        }

        .profile-section {
            display: flex;
            margin-bottom: 40px;
            align-items: flex-end;
            gap: 30px;
            max-width: 800px;
            width: 100%;
            position: relative;
            overflow: hidden;
            background-color: rgba(255, 255, 255, 0.7);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(232, 61, 132, 0.1);
            border: 1px solid var(--idol-light-pink);
        }

        .profile-section::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(
                to bottom right,
                rgba(255, 158, 181, 0.1),
                rgba(255, 158, 181, 0) 50%
            );
            transform: rotate(30deg);
            z-index: -1;
        }

        .profile-pic {
            width: 250px;
            height: 250px;
            border-radius: 50%;
            object-fit: cover;
            box-shadow: 0 10px 30px rgba(232, 61, 132, 0.2);
            animation: float 6s ease-in-out infinite;
            border: 5px solid var(--idol-white);
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-15px); }
            100% { transform: translateY(0px); }
        }

        .profile-info h1 {
            font-size: 48px;
            margin-bottom: 10px;
            font-weight: 900;
            color: var(--idol-dark-pink);
            text-shadow: 0 2px 5px rgba(255, 158, 181, 0.3);
        }

        .profile-info p {
            color: var(--idol-dark);
            margin-bottom: 20px;
            font-size: 16px;
        }

        .section-title {
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: 700;
            align-self: flex-start;
            max-width: 800px;
            width: 100%;
            color: var(--idol-dark-pink);
            padding-bottom: 5px;
            border-bottom: 2px dashed var(--idol-gray);
        }

        .music-container {
            max-width: 800px;
            width: 100%;
            margin-bottom: 40px;
        }

        .music-card {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 15px;
            padding: 20px;
            transition: all 0.3s;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 20px;
            position: relative;
            border: 1px solid var(--idol-light-pink);
            box-shadow: 0 5px 15px rgba(232, 61, 132, 0.1);
        }

        .music-card:hover {
            background-color: rgba(255, 255, 255, 0.9);
            border: 1px solid var(--idol-pink);
            box-shadow: 0 10px 25px rgba(232, 61, 132, 0.2);
            transform: translateY(-3px);
        }

        .music-cover {
            width: 120px;
            height: 120px;
            border-radius: 10px;
            object-fit: cover;
            box-shadow: 0 8px 20px rgba(232, 61, 132, 0.2);
            transition: transform 0.3s;
            border: 3px solid var(--idol-white);
        }

        .music-card:hover .music-cover {
            transform: scale(1.05) rotate(2deg);
        }

        .music-info {
            flex-grow: 1;
        }

        .music-title {
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 20px;
            color: var(--idol-dark-pink);
        }

        .music-artist {
            color: var(--idol-dark);
            font-size: 16px;
        }

        .youtube-player {
            width: 100%;
            aspect-ratio: 16 / 9;
            border-radius: 15px;
            overflow: hidden;
            margin-top: 20px;
            box-shadow: 0 10px 30px rgba(232, 61, 132, 0.2);
            border: 3px solid var(--idol-white);
        }

        .player-bar {
            background: linear-gradient(to right, 
                          rgba(255, 255, 255, 0.9), 
                          rgba(255, 255, 255, 0.9));
            padding: 15px 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: sticky;
            bottom: 0;
            z-index: 100;
            border-top: 1px solid var(--idol-gray);
            box-shadow: 0 -5px 20px rgba(90, 45, 65, 0.1);
            backdrop-filter: blur(5px);
        }

        .song-info {
            display: flex;
            align-items: center;
            gap: 15px;
            width: 25%;
        }

        .song-cover {
            width: 50px;
            height: 50px;
            border-radius: 8px;
            object-fit: cover;
            box-shadow: 0 4px 10px rgba(232, 61, 132, 0.2);
            border: 2px solid var(--idol-white);
        }

        .song-text h4 {
            font-size: 14px;
            margin-bottom: 5px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            color: var(--idol-dark-pink);
        }

        .song-text p {
            font-size: 12px;
            color: var(--idol-dark);
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .player-controls {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 50%;
        }

        .control-buttons {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 10px;
        }

        .control-btn {
            background: none;
            border: none;
            color: var(--idol-dark);
            font-size: 16px;
            cursor: pointer;
            transition: all 0.2s;
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
        }

        .control-btn:hover {
            color: var(--idol-dark-pink);
            background-color: rgba(232, 61, 132, 0.1);
        }

        .play-btn {
            background-color: var(--idol-dark-pink);
            color: var(--idol-white);
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s;
            box-shadow: 0 4px 10px rgba(232, 61, 132, 0.3);
            border: 2px solid var(--idol-white);
        }

        .play-btn:hover {
            transform: scale(1.05);
            background-color: var(--idol-pink);
            box-shadow: 0 6px 15px rgba(232, 61, 132, 0.4);
        }

        .progress-container {
            width: 100%;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .progress-time {
            font-size: 12px;
            color: var(--idol-dark);
            min-width: 40px;
        }

        .progress-bar {
            height: 4px;
            background-color: var(--idol-gray);
            border-radius: 2px;
            flex-grow: 1;
            cursor: pointer;
            position: relative;
        }

        .progress {
            height: 100%;
            background-color: var(--idol-dark-pink);
            border-radius: 2px;
            width: 30%;
            position: relative;
        }

        .progress::after {
            content: '';
            position: absolute;
            right: -5px;
            top: 50%;
            transform: translateY(-50%);
            width: 10px;
            height: 10px;
            background-color: var(--idol-white);
            border-radius: 50%;
            opacity: 0;
            transition: opacity 0.2s;
            border: 2px solid var(--idol-dark-pink);
        }

        .progress-bar:hover .progress::after {
            opacity: 1;
        }

        .volume-controls {
            display: flex;
            align-items: center;
            gap: 10px;
            width: 25%;
            justify-content: flex-end;
        }

        .volume-icon {
            color: var(--idol-dark);
            cursor: pointer;
        }

        .volume-bar {
            height: 4px;
            background-color: var(--idol-gray);
            border-radius: 2px;
            width: 100px;
            cursor: pointer;
            position: relative;
        }

        .volume-progress {
            height: 100%;
            background-color: var(--idol-dark-pink);
            border-radius: 2px;
            width: 70%;
        }

        .like-btn {
            color: var(--idol-gray);
            background: none;
            border: none;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.2s;
            margin-left: 15px;
        }

        .like-btn:hover {
            color: var(--idol-dark-pink);
        }

        .liked {
            color: var(--idol-dark-pink);
            animation: heartBeat 0.5s;
        }

        @keyframes heartBeat {
            0% { transform: scale(1); }
            25% { transform: scale(1.2); }
            50% { transform: scale(1); }
            75% { transform: scale(1.2); }
            100% { transform: scale(1); }
        }

        .pulse {
            animation: pulse 2s infinite;
        }

        .heart-float {
            position: absolute;
            pointer-events: none;
            opacity: 0;
            color: var(--idol-pink);
            animation: floatUp 3s ease-in forwards;
            z-index: 1000;
        }

        @keyframes floatUp {
            0% {
                transform: translateY(0) rotate(0deg);
                opacity: 1;
            }
            100% {
                transform: translateY(-100px) rotate(20deg);
                opacity: 0;
            }
        }

        @media (max-width: 768px) {
            .profile-section {
                flex-direction: column;
                align-items: center;
                text-align: center;
            }

            .profile-info {
                text-align: center;
            }

            .profile-info h1 {
                font-size: 36px;
            }

            .music-card {
                flex-direction: column;
                text-align: center;
            }

            .player-bar {
                flex-direction: column;
                padding: 10px;
                gap: 10px;
            }

            .song-info, .player-controls, .volume-controls {
                width: 100%;
                justify-content: center;
            }

            .song-info {
                justify-content: flex-start;
            }

            .volume-controls {
                margin-top: 10px;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="tap-to-start" id="tap-to-start">
        <div class="tap-content">
            <h1 style="font-size: 3rem; margin-bottom: 2rem; color: var(--idol-white); text-shadow: 0 2px 5px rgba(232, 61, 132, 0.5);">=LOVE STYLE</h1>
            <button class="tap-button">TAP!</button>
        </div>
    </div>

    <div class="content" id="content">
        <header>
            <div class="logo">PROFILE</div>
        </header>

        <main>
            <section class="profile-section">
                <img src="https://i.pinimg.com/736x/05/2f/82/052f82c5243f5c246f93d9e5d276bca2.jpg" alt="Profile Picture" class="profile-pic">
                <div class="profile-info">
                    <h1>assmero</h1>
                    <p>カーダー</p>
                </div>
            </section>

            <section class="music-container">
                <h2 class="section-title">Favorite Song</h2>
                <div class="music-card" id="favorite-song">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqNyka2qIWnJX9onBmWgbYAgPl4j5VdFUiiHHGn5RJgk8yhMLq8vy4z68&s=10" alt="Song Cover" class="music-cover">
                    <div class="music-info">
                        <h3 class="music-title">とくべちゅ、して</h3>
                        <p class="music-artist">=LOVE</p>
                    </div>
                </div>

                <div class="youtube-player" id="youtube-player">
                    <iframe width="100%" height="100%" src="https://www.youtube.com/embed/F3P8vcZkIh4?enablejsapi=1&autoplay=1" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </section>
        </main>

        <div class="player-bar">
            <div class="song-info">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqNyka2qIWnJX9onBmWgbYAgPl4j5VdFUiiHHGn5RJgk8yhMLq8vy4z68&s=10" alt="Now Playing" class="song-cover">
                <div class="song-text">
                    <h4>とくべちゅ、して</h4>
                    <p>=LOVE</p>
                </div>
                <button class="like-btn"><i class="fas fa-heart"></i></button>
            </div>
            <div class="player-controls">
                <div class="control-buttons">
                    <button class="control-btn"><i class="fas fa-random"></i></button>
                    <button class="control-btn"><i class="fas fa-step-backward"></i></button>
                    <button class="play-btn" id="main-play-btn"><i class="fas fa-pause"></i></button>
                    <button class="control-btn"><i class="fas fa-step-forward"></i></button>
                    <button class="control-btn"><i class="fas fa-redo"></i></button>
                </div>
                <div class="progress-container">
                    <span class="progress-time" id="current-time">0:00</span>
                    <div class="progress-bar" id="progress-bar">
                        <div class="progress" id="progress"></div>
                    </div>
                    <span class="progress-time" id="duration">4:12</span>
                </div>
            </div>
            <div class="volume-controls">
                <i class="fas fa-volume-up volume-icon"></i>
                <div class="volume-bar">
                    <div class="volume-progress"></div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const tapToStart = document.getElementById('tap-to-start');
            const content = document.getElementById('content');
            const youtubePlayer = document.getElementById('youtube-player');
            const favoriteSong = document.getElementById('favorite-song');
            const mainPlayBtn = document.getElementById('main-play-btn');
            const progress = document.getElementById('progress');
            const progressBar = document.getElementById('progress-bar');
            const currentTimeEl = document.getElementById('current-time');
            const durationEl = document.getElementById('duration');
            const likeBtn = document.querySelector('.like-btn');

            let player;
            let isPlaying = true;
            let progressInterval;
            let heartInterval;

            // ハートフロートエフェクト
            function createHeart() {
                const heart = document.createElement('div');
                heart.classList.add('heart-float');
                heart.innerHTML = '<i class="fas fa-heart"></i>';
                heart.style.left = Math.random() * 100 + 'vw';
                heart.style.fontSize = (Math.random() * 20 + 10) + 'px';
                heart.style.opacity = Math.random() * 0.5 + 0.5;
                document.body.appendChild(heart);

                setTimeout(() => {
                    heart.remove();
                }, 3000);
            }

            // 定期的にハートを生成
            function startHeartEffect() {
                heartInterval = setInterval(() => {
                    createHeart();
                }, 800); // 0.8秒ごとにハートを生成
            }

            // TAPボタンをクリックしたらコンテンツを表示
            document.querySelector('.tap-button').addEventListener('click', function() {
                // ハートエフェクトを5つ作成
                for (let i = 0; i < 5; i++) {
                    setTimeout(createHeart, i * 200);
                }

                // TAP画面をフェードアウト
                tapToStart.classList.add('hide');

                // コンテンツをフェードイン
                setTimeout(() => {
                    content.classList.add('show');
                    tapToStart.style.display = 'none';
                    // ハートエフェクトを開始
                    startHeartEffect();
                }, 500);

                // 自動再生を開始
                if (player) {
                    player.playVideo();
                }
            });

            // YouTube APIの読み込み
            const tag = document.createElement('script');
            tag.src = "https://www.youtube.com/iframe_api";
            const firstScriptTag = document.getElementsByTagName('script')[0];
            firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

            // YouTubeプレーヤーの初期化
            window.onYouTubeIframeAPIReady = function() {
                player = new YT.Player('youtube-player', {
                    height: '100%',
                    width: '100%',
                    videoId: 'F3P8vcZkIh4',
                    playerVars: {
                        'autoplay': 1,
                        'controls': 0,
                        'disablekb': 1,
                        'modestbranding': 1
                    },
                    events: {
                        'onReady': onPlayerReady,
                        'onStateChange': onPlayerStateChange
                    }
                });
            };

            function onPlayerReady(event) {
                durationEl.textContent = formatTime(event.target.getDuration());
                startProgressBar();
            }

            function onPlayerStateChange(event) {
                if (event.data === YT.PlayerState.PLAYING) {
                    isPlaying = true;
                    mainPlayBtn.innerHTML = '<i class="fas fa-pause"></i>';
                    document.querySelector('.play-btn').classList.add('pulse');
                } else if (event.data === YT.PlayerState.PAUSED || event.data === YT.PlayerState.ENDED) {
                    isPlaying = false;
                    mainPlayBtn.innerHTML = '<i class="fas fa-play"></i>';
                    document.querySelector('.play-btn').classList.remove('pulse');
                    clearInterval(progressInterval);
                }
            }

            favoriteSong.addEventListener('click', function() {
                youtubePlayer.style.display = 'block';
                player.playVideo();
            });

            document.querySelector('.play-btn').addEventListener('click', function() {
                if (isPlaying) {
                    player.pauseVideo();
                } else {
                    player.playVideo();
                }
            });

            likeBtn.addEventListener('click', function() {
                this.classList.toggle('liked');
                if (this.classList.contains('liked')) {
                    for (let i = 0; i < 3; i++) {
                        setTimeout(createHeart, i * 300);
                    }
                }
            });

            progressBar.addEventListener('click', function(e) {
                const percent = e.offsetX / this.offsetWidth;
                const newTime = percent * player.getDuration();
                player.seekTo(newTime);
            });

            function startProgressBar() {
                clearInterval(progressInterval);
                progressInterval = setInterval(() => {
                    const currentTime = player.getCurrentTime();
                    const duration = player.getDuration();
                    const percent = (currentTime / duration) * 100;
                    progress.style.width = `${percent}%`;
                    currentTimeEl.textContent = formatTime(currentTime);
                }, 1000);
            }

            function formatTime(seconds) {
                const mins = Math.floor(seconds / 60);
                const secs = Math.floor(seconds % 60);
                return `${mins}:${secs < 10 ? '0' + secs : secs}`;
            }
        });
    </script>
</body>
</html>
