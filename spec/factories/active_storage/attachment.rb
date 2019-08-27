FactoryBot.define do
  factory :attachment, class: ActiveStorage::Attachment do
    id {1}
    name {"avatar"}
    record_type {"User"}
    record_id {1}
    blob_id{1}
    created_at {"2019-08-25 04:34:42"}
    association :blob, factory: :blob
  end
end