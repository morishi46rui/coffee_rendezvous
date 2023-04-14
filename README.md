<h1>Coffee Rendezvous</h1>

<h2>概要</h2>
<p>このアプリケーションは、ユーザーが気になるカフェの情報を登録・共有することを目的としています。店舗名やエリア名の検索、カフェの特徴によってあなた好みのカフェを見つけることができます。</p>

<h2>背景</h2>
<p>「チェーン店のカフェばかりでつまらない。奴らは広告に金をかけられるから検索すれば上位に表示される。排除しろ。」
恋人のそんな物騒な発言がきっかけでした。もちろん物理的に排除することは不可能なので、ならばチェーン店以外の個性的で魅力的なカフェが登録され、探すことができるアプリケーションを作ろうと思い、制作に取り組みました。</p>

<h2>機能</h2>
<ul>
  <li>ユーザー登録・ログイン機能</li>
  <li>カフェ情報の登録・編集・削除</li>
  <li>カフェ情報の閲覧機能</li>
  <li>カフェ情報の検索機能</li>
  <li>カフェのブックマーク機能・コメント機能</li>
</ul>

<h2>デモ</h2>
<h4>1.トップページ</h4>
<img src="https://user-images.githubusercontent.com/64954428/231760793-4adb44cf-7bf6-4237-b51a-cb999dc65465.jpeg" />

<h4>2.トップページコンテンツ</h4>
<p>新着カフェ：新規に登録されたカフェが降順に3件表示されます。</p>
<p>新着コメント：新規に投稿されたコメントが降順に3件表示されます。コメントが投稿されたカフェの詳細ページにリンクされています。</p>
<p>人気のカフェ：ブックマーク数に基づいて、人気のカフェ上位3件が表示されます。各カフェの詳細ページにリンクされています。</p>
<img src="https://user-images.githubusercontent.com/64954428/231761644-e23a4a65-3927-4488-841b-f2de68b5feea.jpeg" />
<p>また、現在地から周辺のカフェを調べることができます。登録されているカフェがある場合マーカーが表示されます。</p>
<img src="https://user-images.githubusercontent.com/64954428/231765068-594536a7-9e94-4eb0-8b8c-9af3de93f5e7.jpeg" />

<h4>3.カフェ登録画面</h4>
<p>自分のお気に入りのカフェを登録することができます。店名と住所は必須項目です。</p>
<img src="https://user-images.githubusercontent.com/64954428/231762761-c01b9a09-7ddd-4674-8287-a5e84bbef756.jpeg" />

<h4>4.カフェ詳細画面</h4>
<p>カフェ登録時に写真を複数枚アップロードするとカルーセル表示されます。電話番号が登録されている場合、クリックすることによって電話することができます。またマップには位置情報が表示されており、ウィンドウの"Googleマップで経路を検索する"をクリックすると、別タブでGoogleマップにリンクされ、現在地からの経路を表示します。</p>
<img src="https://user-images.githubusercontent.com/64954428/231765187-c6d1f1d2-93b0-47e9-b819-12b87efe9ab3.jpeg" />

<h4>5.コメント機能・ブックマーク機能</h4>
<p>カフェ詳細画面ではコメント機能とブックマーク機能を使用できます。自分のコメント、ブックマークはマイページに表示されます。</p>
<img src="https://user-images.githubusercontent.com/64954428/231764661-7a639494-77d7-4632-a7a8-c5faf7be7576.jpeg" />
<img src="https://user-images.githubusercontent.com/64954428/231765483-42352ca4-0f58-4cc9-a1f5-f2fe62f02b0d.png" />

<h4>6.カフェ検索画面</h4>
<p>店名・住所のキーワード検索、お店のこだわりによるカテゴリー検索を用いて、カフェを絞り込むことができます。例えばご飯中心にカフェを選びたい時はFoodsにカテゴライズされるカフェのみを表示することができます。</p>
<img src="https://user-images.githubusercontent.com/64954428/231767055-6e81fd59-bfb6-4418-b31b-a5bab59b6cb0.jpeg" />

<h2>こだわったポイント</h2>
<h4>カテゴリーによる検索機能</h4>
<p>1人でカフェに入ることが苦手な人は多いと思います。私もそうです。行ってみたいカフェ、気になっているカフェはたくさんあるのに、「1人で入れる雰囲気だろうか・・・」などと考えてしまいます。</p>
<p>また喫煙者の方にとってタバコ×コーヒーは黄金コンビです。健康増進法の改正によって喫煙可能な飲食店は減っている中、タバコが吸えるカフェを見つけられたら最高ですよね。</p>
<p>そういったニーズに応えるためカテゴリーによってカフェを絞り込めることによって、自分の目的に沿ったカフェをすぐに見つけられるように工夫をしました。</p>

<h4>カフェの登録機能</h4>
<p>飲食店を検索するサービスは多くありますが、飲食店経営者以外のユーザーがお店の情報を登録できる機能を有したサービスはあまり見かけないなと思っていました。</p>
<p>あまり人には知られていないけれども、魅力的なカフェや喫茶店を共有できれば、新しいカフェとの出会いも広がるのではないかと思い実装しました。</p>

<h2>技術スタック</h2>
<ul>
  <li>HTML/CSS</li>
  <li>Bootstrap 5</li>
  <li>Ruby 3.1.4</li>
  <li>Ruby on Rails 7.0.4.3</li>
  <li>Active Storage</li>
  <li>PostgreSQL</li>
  <li>Google Maps Api</li>
  <li>geocoder</li>
  <li>Ransack</li>
</ul>

<h2>ER図</h2>
<img src="https://user-images.githubusercontent.com/64954428/231760395-071edd2d-9140-4026-832f-148d4df23ca4.png" />
