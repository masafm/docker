FROM --platform=linux/amd64 python:3

# Datadog `serverless-init` を Docker イメージにコピーします
COPY --from=datadog/serverless-init /datadog-init /app/datadog-init
COPY app.py /app/app.py
COPY entrypoint.sh /entrypoint.sh

# python トレーシングライブラリをこちらか requirements.txt でインストールします
RUN pip install --no-cache-dir ddtrace==1.13.3

# オプションで Datadog のタグを追加します
ENV DD_SERVICE=datadog-demo-run-python
ENV DD_ENV=datadog-demo
ENV DD_VERSION=1

# この環境変数は、Cloud Run でトレース伝播を正しく動作させるために必要です。
# Datadog でインスツルメンテーションされたすべてのダウンストリームサービスにこの変数を設定します。
ENV DD_TRACE_PROPAGATION_STYLE=datadog

# アプリケーションを Datadog の serverless-init プロセスでラップするためエントリポイントを変更します
ENTRYPOINT ["/entrypoint.sh"]

# Datadog トレースライブラリによって起動されるエントリポイントにラップされたバイナリアプリケーションを実行します。必要に応じて内容を変更してください。
#CMD ["/entrypoint.sh"]
