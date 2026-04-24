#!/bin/bash

# GitHub Pages 업로드 스크립트
# 사용법: ./upload_to_github.sh YOUR-GITHUB-USERNAME

if [ -z "$1" ]; then
    echo "사용법: $0 <GitHub-사용자명>"
    echo "예시: $0 johndoe"
    exit 1
fi

USERNAME=$1
REPO_URL="https://github.com/$USERNAME/baby-journal-policies.git"

echo "🌐 GitHub Pages 업로드 시작..."
echo "📁 저장소: $REPO_URL"

# 기존 remote 제거 (있다면)
git remote remove origin 2>/dev/null || true

# 새 remote 추가
git remote add origin $REPO_URL

# 브랜치명 설정
git branch -M main

# 파일 상태 확인
echo "📋 업로드할 파일들:"
ls -la *.html

# GitHub에 업로드
echo "⬆️  GitHub에 업로드 중..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo "✅ 업로드 완료!"
    echo ""
    echo "🔗 5분 후 다음 URL들이 활성화됩니다:"
    echo "   메인: https://$USERNAME.github.io/baby-journal-policies/"
    echo "   개인정보: https://$USERNAME.github.io/baby-journal-policies/privacy.html"
    echo "   이용약관: https://$USERNAME.github.io/baby-journal-policies/terms.html"
    echo ""
    echo "📋 다음 단계: GitHub 저장소 Settings → Pages에서 활성화하세요"
else
    echo "❌ 업로드 실패. GitHub 저장소가 생성되었는지 확인하세요."
fi