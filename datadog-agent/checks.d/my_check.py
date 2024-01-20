from checks import AgentCheck

class MyCheck(AgentCheck):
  def check(self, instance):
    # ファイルから数値を読み込み
    file_path = '/tmp/my_check.txt'  # ファイルのパスを適切に設定
    try:
        with open(file_path, 'r') as file:
            current_value = int(file.read().strip())
    except Exception:
        # ファイルが存在しない場合、初期値を設定
        current_value = 1

    for i in range(0, 10000):
        if current_value % 4 == 0:
            self.gauge("my.check.{:0=5}".format(i), 1)
        else:
            self.gauge("my.check.{:0=5}".format(i), 0)

    # 数値をインクリメント
    new_value = current_value + 1

    # ファイルに新しい値を書き込み
    with open(file_path, 'w') as file:
        file.write(str(new_value))

    #print(f'Incremented value: {new_value}')
