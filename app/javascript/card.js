// 支払いを行う関数を定義
const pay = () => {
  // PAY.JPのテスト用公開鍵を使って、Payjpオブジェクトを作成する
  const publicKey = gon.public_key
  const payjp = Payjp(publicKey)
  // Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY)
  // 支払いに関する要素を作成する
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber'); // カード番号入力欄
  const expiryElement = elements.create('cardExpiry'); // 有効期限入力欄
  const cvcElement = elements.create('cardCvc'); // セキュリティコード入力欄

  // 入力欄を特定の場所にマウント（表示）させる
  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  // 入力フォーム全体をform変数に格納する
  const form = document.getElementById('charge-form');
  // フォームが送信された時に以下の処理を行う
  form.addEventListener("submit", (e) => {
    // カード情報を元にトークンを作成し、処理を続行する
    payjp.createToken(numberElement).then(function (response) {
      // トークンが作成された場合の処理
      if (response.error) {
        // エラーがあればここで処理を中断
      } else {
        // トークンが正常に作成された場合の処理
        const token = response.id; // トークンのIDを取得する
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        // トークンをフォームに追加する
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      // 入力欄をクリアする
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      // フォームを送信する
      document.getElementById("charge-form").submit();
    });
    e.preventDefault(); // デフォルトの動作をキャンセル（フォームの自動送信をキャンセル）
  });
};

// ウェブページが読み込まれたら、pay関数を実行する
window.addEventListener("turbo:load", pay);

// pay関数が定義され、ウェブページが読み込まれると、window.addEventListener("turbo:load", pay);によってpay関数が実行
// pay関数内では、PAY.JPのテスト用公開鍵を使用してPayjpオブジェクトを作成し、
//  支払いに関する入力フォーム（カード番号、有効期限、セキュリティコード）を作成
// フォームの送信イベントが発生すると、指定されたカード情報を元にトークンを作成
// トークンの作成が成功した場合、そのトークンを隠しフィールドとしてフォームに追加
// 入力欄の情報をクリアし、フォームを最終的に送信して支払い処理を完了