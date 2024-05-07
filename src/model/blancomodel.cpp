#include "blancomodel.h"
#include <QCoreApplication>
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QDebug>
#include <QVariantList>
#include <QVariantMap>

BlancoModel::BlancoModel(GameModel *parent)
    : GameModel{parent}
{}

void BlancoModel::init(QString path)
{
    QFile file(path);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qDebug() << "Failed to open the file:" << path;
        return;
    }

    QByteArray jsonData = file.readAll();
    file.close();

    QJsonDocument document = QJsonDocument::fromJson(jsonData);
    if (document.isNull()) {
        qDebug() << "Failed to create JSON doc.";
        return;
    }
    if (!document.isObject()) {
        qDebug() << "JSON is not an object.";
        return;
    }

    QJsonObject jsonObject = document.object();

    mName = jsonObject["name"].toString();
    mAnimal = jsonObject["animal"].toString();
    mType = jsonObject["type"].toString();
    mDifficulty = jsonObject["difficulty"].toInt();
    mEstimatedTime = jsonObject["estimatedTime"].toInt();
    mMinPeople = jsonObject["minPeople"].toInt();
    mMaxPeople = jsonObject["maxPeople"].toInt();
    QJsonArray description = jsonObject["description"].toArray();

    QVariantMap pair;
    for (const auto& item : description) {
        QJsonArray jsonPair = item.toArray();
        QString text = jsonPair.at(0).toString();
        QString image = jsonPair.at(1).toString();
        pair.insert("first", text);
        pair.insert("second", image);
        mDescription.append(pair);
    }
}

QStringList BlancoModel::players()
{
    return mPlayers;
}

void BlancoModel::setPlayers(const QStringList &newPlayers)
{
    if (mPlayers == newPlayers)
        return;
    mPlayers = newPlayers;
    emit playersChanged();
}

QString BlancoModel::blancoState() const
{
    return mBlancoState;
}

void BlancoModel::setBlancoState(const QString &newBlancoState)
{
    if (mBlancoState == newBlancoState)
        return;
    mBlancoState = newBlancoState;
    emit blancoStateChanged();
}



void BlancoModel::addPlayer(QString playerName)
{
    mPlayers.append(playerName);
    qDebug()<<mPlayers;
}
