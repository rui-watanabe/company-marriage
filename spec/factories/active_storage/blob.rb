FactoryBot.define do
  factory :blob, class: ActiveStorage::Blob do
    id {1}
    sequence(:key) { SecureRandom.urlsafe_base64 }  # ユニークなキーでなければならない
    filename {"test_image.png"}
    content_type {'image/png'}
    metadata {{"identified":true}}
    byte_size {13317}
    checksum {"R-EvpP3cJEEQCSwQq/FRCF=="}
    created_at {"2019-08-25 04:34:42"}
end