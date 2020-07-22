%% Conex�o
vrep = remApi('remoteApi');
vrep.simxFinish(-1);
clientID = vrep.simxStart('127.0.0.1',19999,true,true,5000,5);
if (clientID>-1);
disp('conectado');

%% Elementos do Rob�
[returnCode, art_1] = vrep.simxGetObjectHandle...
    (clientID, 'UR5_joint1', vrep.simx_opmode_blocking);
[returnCode, art_2] = vrep.simxGetObjectHandle...
    (clientID, 'UR5_joint2', vrep.simx_opmode_blocking);
[returnCode, art_3] = vrep.simxGetObjectHandle...
    (clientID, 'UR5_joint3', vrep.simx_opmode_blocking);
[returnCode, art_4] = vrep.simxGetObjectHandle...
    (clientID, 'UR5_joint4', vrep.simx_opmode_blocking);
[returnCode, art_5] = vrep.simxGetObjectHandle...
    (clientID, 'UR5_joint5', vrep.simx_opmode_blocking);
[returnCode, art_6] = vrep.simxGetObjectHandle...
    (clientID, 'UR5_joint6', vrep.simx_opmode_blocking);

%% Aviso de Conex�o de Estabelecida
vrep.simxAddStatusbarMessage(clientID,...
    'Comunica��o com o MATLAB iniciada', vrep.simx_opmode_blocking);
disp('Comunica��o com o V-REP iniciada');

%% Movimenta��o
[returnCode] = vrep.simxSetJointTargetPosition...
    (clientID, art_1, 5, vrep.simx_opmode_oneshot);
pause(2);
[returnCode] = vrep.simxSetJointTargetPosition...
    (clientID, art_2, -1, vrep.simx_opmode_oneshot);
pause(2);
[returnCode] = vrep.simxSetJointTargetPosition...
    (clientID, art_3, 1, vrep.simx_opmode_oneshot);
pause(2);
[returnCode] = vrep.simxSetJointTargetPosition...
    (clientID, art_4, 4, vrep.simx_opmode_oneshot);
pause(2);
[returnCode] = vrep.simxSetJointTargetPosition...
    (clientID, art_5, -3, vrep.simx_opmode_oneshot);
pause(2);
[returnCode] = vrep.simxSetJointTargetPosition...
    (clientID, art_6, -1, vrep.simx_opmode_oneshot);
pause(2);
end

%% Desconex�o 
vrep.simxAddStatusbarMessage(clientID,...
    'Comunica��o com o MATLAB finalizada', vrep.simx_opmode_blocking);
vrep.simxFinish(-1);
disp('Comunica��o com o V-REP finalizada');
vrep.delete();
pause(2);
clear all; clc;


