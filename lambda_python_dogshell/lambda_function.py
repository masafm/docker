import json
import subprocess
import boto3
from botocore.exceptions import NoCredentialsError

def handler(event, context):
    dashboard=run_shell_command('dog dashboard show kms-shp-5k6')
    monitors=run_shell_command('dog monitor show_all')

    upload_data_to_s3(dashboard, "masafumi.kashiwagi.s3.bucket.test", "dashboard.txt")
    upload_data_to_s3(monitors, "masafumi.kashiwagi.s3.bucket.test", "monitors.txt")
    
    return {
        'statusCode': 200,
        'body': json.dumps('Backup finished!')
    }

def upload_data_to_s3(data, bucket, object_name):
    """
    S3バケットにデータをアップロードする関数

    :param data: アップロードするデータ（文字列やバイト列）
    :param bucket: アップロード先のS3バケット名
    :param object_name: S3に保存するときのオブジェクト名
    :return: Trueを返すと成功、例外が発生した場合はログに記録してFalseを返す
    """
    # S3サービスクライアントを作成
    s3_client = boto3.client('s3')

    try:
        # データをアップロード
        s3_client.put_object(Body=data, Bucket=bucket, Key=object_name)
    except NoCredentialsError as e:
        print("認証情報が見つかりません。AWSの設定を確認してください。")
        return False
    except Exception as e:
        print(f'データのアップロード中にエラーが発生しました: {e}')
        return False
    return True

def run_shell_command(command):
    """
    シェルコマンドを実行し、その標準出力を返す関数

    :param command: 実行するシェルコマンド（文字列または文字列のリスト）
    :return: コマンドの標準出力（文字列）
    """
    try:
        # コマンドを実行し、出力をキャプチャ
        result = subprocess.run(command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, shell=True)
        return result.stdout
    except subprocess.CalledProcessError as e:
        # コマンド実行エラーが発生した場合
        print("コマンドの実行中にエラーが発生しました:", e)
        print("エラー出力:", e.stderr)
        return None
