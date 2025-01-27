//

bool isValidSpaceId(String spaceId) => RegExp(r'^[A-Za-z_0-9]+$').hasMatch(spaceId);
bool isValidGroupName(String groupName) => RegExp(r'^[a-zA-Z _0-9\-]+$').hasMatch(groupName);
bool isValidEmail(String email) => RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
    .hasMatch(email);
