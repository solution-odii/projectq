

class JoinQueueModel {
  int queueId;
  String queueKey;
  int sessionId;
  String updatedAt;
  String createdAt;
  int id;
  String cloudMsgId;

  JoinQueueModel(
      {this.queueId,
        this.queueKey,
        this.sessionId,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.cloudMsgId});

  JoinQueueModel.fromJson(Map<String, dynamic> json) {
    queueId = json['queue_id'];
    queueKey = json['queue_key'];
    sessionId = json['session_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    cloudMsgId = json['cloud_msg_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['queue_id'] = this.queueId;
    data['queue_key'] = this.queueKey;
    data['session_id'] = this.sessionId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['cloud_msg_id'] = this.cloudMsgId;
    return data;
  }
}