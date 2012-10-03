/*
    > ������� ������ ��� ��������
        ������� ������� ������
        1. ���������� ������� ������ ���������� ����� �� ��� ��� ������ �������� (�������� �� ������ ������� - ��� ����� ��������� ����������� ��������)
        2. ������� ���� 1 ��� (�� ����� �� ����� ��������, �� ������� ��� ��������� �� ���� � ��� ����� �����, ��� ������ ���� �����)
        3. �������� ���������� (�������� ����� �� �������� ��������, ����� ��� � �� ������ ���� ����� � ���� ))
        4. �������� ������� ����� ����� (�� � �������� ������� �����������)

        �� ��� ��� ���� ����� ����� ������ ����������, ���� �� ����� ������� - �� ����� � ���� 
*/

WinnerEffect(winner) {
    for (new i=1; i <= MaxClients; i++) {
        if (IsClientInGame(i) && IsPlayerAlive(i)) {
            SetPlayerWinnerEffectAll(i);
        }
    }

    SetPlayerWinnerEffectWinner(winner);
    //UTIL_CreateMultilevelEffect1(winner);
    //UTIL_CreateMultilevelEffect2(winner);
}

SetPlayerWinnerEffectAll(client) {
    // fly
    SetEntityGravity(client, 0.1);
    SlapPlayer(client, 0, false);
}

SetPlayerWinnerEffectWinner(client) {
    // shine    
    // TODO: maybe repeate each 0.1 seconds or attach effect to player
    new Float:vec[3];
    GetClientAbsOrigin(client, vec);
    vec[2] += 10;

    TE_SetupGlowSprite(vec, g_GlowSprite, 0.95, 1.5, 50);
    TE_SendToAll();
}

OnMapStartEffects() {
    //g_GlowSprite = PrecacheModel("sprites/blueglow2.vmt");
    g_GlowSprite = PrecacheModel("materials/sprites/blueflare1.vmt");
}

WinnerEffectsStart(winner) {
    if (g_Cfg_WinnerEffect == 1) {
        WinnerEffect(winner);
    } else {
        UTIL_FreezeAllPlayer();
    }
}
