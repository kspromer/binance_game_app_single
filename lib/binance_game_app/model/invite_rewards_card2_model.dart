class InviteRewardsCard2Model {
  double value;
  String title;
  String icon;
  var style;

  InviteRewardsCard2Model({
      this.value, 
      this.title, 
      this.icon, 
      this.style});

  InviteRewardsCard2Model.fromJson(dynamic json) {
    value = json['value'];
    title = json['title'];
    icon = json['icon'];
    style = json['style'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['value'] = value;
    map['title'] = title;
    map['icon'] = icon;
    map['style'] = style;
    return map;
  }

}